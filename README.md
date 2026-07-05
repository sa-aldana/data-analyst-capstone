# data-analyst-capstone pipeline

In this repository, I have saved the code and process of setting up a simple architecture with 
`DuckDB` as the main database,
`dbt` for data transformations (for a basic medallion architecture), 
`Cube.js` for a semantic layer, and 
`Metabase` for easy-to-integrate visuals (`Superset` can be used for more options for Power Users, but for simplicity, we use `Metabase`).
<br>
A future enhancement will include `Ollama` or `llama.cpp` on top of the semantic model to add basic AI functionality. It will be exposed via a `FastAPI` service. We'll implement this with a small/tiny LLM, but will add functionality to switch to a cloud provider or a larger model.
