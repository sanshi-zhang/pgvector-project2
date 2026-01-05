-- 启用pgvector扩展
CREATE EXTENSION IF NOT EXISTS vector;

-- 创建测试表
CREATE TABLE IF NOT EXISTS items (
    id BIGSERIAL PRIMARY KEY,
    embedding VECTOR(3),  -- 3维向量
    content TEXT
);

-- 插入测试数据
INSERT INTO items (embedding, content) VALUES
('[1,1,1]', '苹果'),
('[2,2,2]', '香蕉'),
('[3,3,3]', '橙子'),
('[4,4,4]', '葡萄');

-- 创建向量索引（可选）
CREATE INDEX ON items USING ivfflat (embedding vector_cosine_ops)
WITH (lists = 100);