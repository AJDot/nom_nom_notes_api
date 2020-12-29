class SearchQueryParams < T::Struct
  const :term, String
  const :not, T.nilable(T::Hash[Symbol, T.untyped])
end

