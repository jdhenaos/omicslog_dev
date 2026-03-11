import sys
from pathlib import Path

def main() -> None:
    print("Python:", sys.version)

    # Minimal deps: numpy + sklearn (small, common). Add torch as needed.
    import numpy as np  # noqa: F401
    from sklearn.linear_model import LogisticRegression

    X = np.random.randn(100, 5)
    y = (X[:, 0] + 0.1 * X[:, 1] > 0).astype(int)

    clf = LogisticRegression(max_iter=200)
    clf.fit(X, y)
    acc = clf.score(X, y)

    out = Path("results")
    out.mkdir(exist_ok=True)
    (out / "smoke_metrics.txt").write_text(f"train_acc={acc:.3f}\n")

    print("Python smoke test completed; wrote results/smoke_metrics.txt")


if __name__ == "__main__":
    main()

