from locust import HttpUser, TaskSet, task, between

from django_speech_emotion_backend.secrets import test_user_data


class UserBehavior(TaskSet):
    def on_start(self):
        res = self.client.post(
            "/auth/login/",
            json=test_user_data,
        )

        if res.status_code == 200:
            token = res.json()["access"]
            self.client.headers.update({"Authorization": f"Bearer {token}"})

        # requested for only once
        self.client.get("/challenges/pre/popular/")

    @task(5)
    def get_histories_pre(self):
        self.client.get("/challenge-histories/pre/")

    @task(4)
    def get_history_scores(self):
        self.client.get("/challenges/2/get_history_scores/")

    @task(3)
    def get_history(self):
        self.client.get("/challenge-histories/32/")

    @task(2)
    def get_challenge_recording(self):
        self.client.get("/challenges/2/recording/")

    @task(1)
    def get_random_challenge(self):
        self.client.get("/challenges/pre/random/")


class WebsiteUser(HttpUser):
    tasks = [UserBehavior]
    wait_time = between(10, 15)
    host = "http://localhost:8000/api"
