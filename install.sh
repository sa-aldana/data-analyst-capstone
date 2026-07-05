# # # Install duckdb
# get binary
curl https://install.duckdb.org | sh

# Python package (in its own environment)
conda create -n data-stack python=3.11
conda activate data-stack
pip install duckdb
pip install dbt-duckdb

# # # Instal Corejs

# Node via nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
source ~/.bashrc
nvm install --lts

# Create project
npx cubejs-cli create my-cube-project -d duckdb
cd my-cube-project

# .env additions for DuckDB connection; compu has been used in place of my actual username
echo "CUBEJS_DB_TYPE=duckdb" >> .env
echo "CUBEJS_DB_DUCKDB_DATABASE_PATH=/home/compu/crm_homelab.duckdb" >> .env

# Run
npm run dev

# # # install superset

sudo apt install docker.io
sudo usermod -aG docker $USER
# log out/in for group change

git clone https://github.com/apache/superset.git
cd superset

# Use a stable tag (main branch had broken dependencies)
git fetch --tags
git checkout tags/4.1.1

# Docker Compose V2 plugin (manual install since apt package wasn't available)
mkdir -p ~/.docker/cli-plugins/
curl -SL https://github.com/docker/compose/releases/latest/download/docker-compose-linux-x86_64 -o ~/.docker/cli-plugins/docker-compose
chmod +x ~/.docker/cli-plugins/docker-compose

docker compose -f docker-compose-image-tag.yml up

# # # Install Metabase, instead of Superset

docker run -d -p 3000:3000 --name metabase metabase/metabase

# Watch startup logs (takes 1-2 minutes to initialize)
docker logs -f metabase

# # # Open ports to connect from local network

# FastAPI
sudo ufw allow 8000

# Cube
sudo ufw allow 4000
sudo ufw allow 3030
sudo ufw allow 15432

# Superset
sudo ufw allow 8088

# Metabase
sudo ufw allow 3000

