import os

import torch
import torchaudio
from torch import nn
import torchaudio.transforms as T


def get_features(filepath, sr):
    waveform, orig_sr = torchaudio.load(filepath)

    if waveform.dim() == 1:
        waveform = waveform.unsqueeze(0)

    if waveform.shape[0] > 1:
        waveform = torch.mean(waveform, dim=0, keepdim=True)

    resampler = T.Resample(orig_sr, sr)

    waveform = resampler(waveform)

    return waveform


class EmotionTransformerModel(nn.Module):
    def __init__(self, num_classes=8):
        super().__init__()

        bundle = torchaudio.pipelines.HUBERT_BASE
        self.feature_extractor = bundle.get_model()

        # freeze CNN feature encoder weights just train transformer and classifier
        for param in self.feature_extractor.feature_extractor.parameters():
            param.requires_grad = False

        self.hidden_dim = 768

        # classifier layer
        self.classifier = nn.Sequential(
            nn.Linear(self.hidden_dim, 256),
            nn.ReLU(),
            nn.Dropout(0.3),
            nn.Linear(256, num_classes),
        )

    def merge(self, hidden_states):
        return torch.mean(hidden_states, dim=1)

    def forward(self, x):
        features, _ = self.feature_extractor.extract_features(x)
        pooled = self.merge(features[-1])
        return self.classifier(pooled)


class EmotionModel:
    def __init__(self):
        device = torch.device("cuda" if torch.cuda.is_available() else "cpu")

        self.model = EmotionTransformerModel()
        self.model.load_state_dict(
            torch.load(
                f"{os.getcwd()}/api/util/model/best_model_RAVDESS_hubert.pt",
                map_location=device,
            )
        )

        self.class_labels = [
            "neutral",
            "calm",
            "happy",
            "sad",
            "angry",
            "fearful",
            "disgust",
            "surprised",
        ]
        self.soft = nn.Softmax(dim=1)

    def predict(self, filepath):
        self.model.eval()

        with torch.no_grad():
            waveform = get_features(filepath, 16000)
            output = self.model(waveform)
            return self.soft(output).tolist()[0]
