import numpy as np


def balanced_js_similarity(p, q, epsilon=1e-10):
    def normalize(dist):
        dist = np.array(dist)
        return dist / np.sum(dist) if np.sum(dist) != 0 else dist

    def kl_divergence(p, q):
        p = np.array(p) + epsilon
        q = np.array(q) + epsilon
        return np.sum(p * np.log(p / q), where=(p != 0) & (q != 0))

    def js_divergence(p, q):
        m = 0.5 * (p + q)
        return 0.5 * (kl_divergence(p, m) + kl_divergence(q, m))

    p = normalize(p)
    q = normalize(q)

    jsd = js_divergence(p, q)

    jsd_max = np.log(2)
    jsd = min(jsd, jsd_max)

    normalized_jsd = jsd / jsd_max

    adjusted_jsd = normalized_jsd**0.5

    # Invert to similarity
    similarity = (1 - adjusted_jsd) * 100
    return similarity
