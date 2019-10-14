module Data.Semigroup.Builder where

newtype SemigroupBuilder a =
  SemigroupBuilder { runSemigroupBuilder :: forall r. Semigroup r => (a -> r) -> r }

instance Semigroup (SemigroupBuilder a) where
  f <> g = SemigroupBuilder (runSemigroupBuilder f <> runSemigroupBuilder g)

singletonSemigroupBuilder :: a -> SemigroupBuilder a
singletonSemigroupBuilder a = SemigroupBuilder ($ a)
