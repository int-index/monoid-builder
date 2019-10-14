module Data.Monoid.Builder where

import Data.Semigroup.Builder

newtype MonoidBuilder a =
  MonoidBuilder { runMonoidBuilder :: forall r. Monoid r => (a -> r) -> r }

instance Semigroup (MonoidBuilder a) where
  f <> g = MonoidBuilder (runMonoidBuilder f <> runMonoidBuilder g)

instance Monoid (MonoidBuilder a) where
  mempty = MonoidBuilder mempty

singletonMonoidBuilder :: a -> MonoidBuilder a
singletonMonoidBuilder a = MonoidBuilder ($ a)

semigroupToMonoidBuilder :: SemigroupBuilder a -> MonoidBuilder a
semigroupToMonoidBuilder (SemigroupBuilder f) = MonoidBuilder f
