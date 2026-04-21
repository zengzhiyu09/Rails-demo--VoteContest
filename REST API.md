### Hong Kong Beauty Contest API Documentation

#### API Overview

本API为香港选美投票系统提供后端支持。它允许客户端获取候选人列表、进行投票、查看分页数据以及管理用户会话。

- **基础路径 (Base Path):** `/`
- **数据格式:** `application/json`
- **认证方式:** Session/Cookie 认证 (基于 Devise)

#### 1. 候选人模块

**1.1 获取候选人列表**

- **API名称:** 获取分页候选人列表
- **简要描述:** 获取所有候选人的分页列表信息，包含候选人基本信息（姓名、年龄、背景故事、视频链接等）。
- **定义:**
    - **请求方法:** `GET`
    - **端点:** `/candidates`
    - **参数:**
        - `page` (Integer, 可选): 页码，默认为 1。每页包含 20 个候选人。
- **Request示例:**

```
GET /candidates?page=1 HTTP/1.1
Host: localhost:3000
Accept: application/json
```

- **Response示例:**

```
{
  "current_page": 1,
  "total_pages": 3,
  "per_page": 20,
  "candidates": [
    {
      "id": 1,
      "name": "Candidate A",
      "age": 22,
      "backstory": "She loves dancing.",
      "video_url": "https://example.com/video1.mp4",
      "has_voted": false
    },
    {
      "id": 2,
      "name": "Candidate B",
      "age": 24,
      "backstory": "Aspiring actress.",
      "video_url": "https://example.com/video2.mp4",
      "has_voted": true
    }
  ]
}
```

**1.2 投票**

- **API名称:** 为候选人投票
- **简要描述:** 当前登录用户为指定的候选人投出一票。投票后，该用户将无法再为其他候选人投票。
- **定义:**
    - **请求方法:** `POST`
    - **端点:** `/candidates/:id/vote`
    - **路径参数:**
        - `id` (Integer, 必填): 候选人的唯一标识符。
- **Request示例:**

```
POST /candidates/1/vote HTTP/1.1
Host: localhost:3000
Accept: application/json
Content-Type: application/json
# 需要携带有效的 Session Cookie
```

- **Response示例 (成功):**

```
{
  "success": true,
  "message": "Vote successfully cast for Candidate A",
  "candidate_id": 1
}
```

- **Response示例 (已投票):**

```
{
  "success": false,
  "message": "You have already voted for another candidate."
}
```

#### 2. 用户认证模块

**2.1 用户注册**

- **API名称:** 注册新用户
- **简要描述:** 创建一个新的用户账户，用于参与投票。
- **定义:**
    - **请求方法:** `POST`
    - **端点:** `/users`
    - **请求体:**
        - `user[email]` (String, 必填): 用户邮箱。
        - `user[password]` (String, 必填): 用户密码。
        - `user[phone_number]` (String, 可选): 用户手机号。
- **Request示例:**

```
POST /users HTTP/1.1
Host: localhost:3000
Accept: application/json
Content-Type: application/json

{
  "user": {
    "email": "voter@example.com",
    "password": "securepassword123",
    "phone_number": "12345678"
  }
}
```

- **Response示例:**

```
{
  "id": 101,
  "email": "voter@example.com",
  "phone_number": "12345678",
  "created_at": "2026-04-21T16:18:46Z"
}
```

**2.2 用户登录**

- **API名称:** 用户登录
- **简要描述:** 用户通过邮箱和密码登录系统，获取会话凭证。
- **定义:**
    - **请求方法:** `POST`
    - **端点:** `/users/sign_in`
    - **请求体:**
        - `user[email]` (String, 必填): 用户邮箱。
        - `user[password]` (String, 必填): 用户密码。
- **Request示例:**

```
POST /users/sign_in HTTP/1.1
Host: localhost:3000
Accept: application/json
Content-Type: application/json

{
  "user": {
    "email": "voter@example.com",
    "password": "securepassword123"
  }
}
```

- **Response示例:**

```
{
  "success": true,
  "message": "Signed in successfully."
}
```

**2.3 更新用户信息**

- **API名称:** 更新用户信息
- **简要描述:** 更新当前登录用户的信息，例如手机号码。
- **定义:**
    - **请求方法:** `PUT` / `PATCH`
    - **端点:** `/users`
    - **请求体:**
        - `user[phone_number]` (String, 可选): 新的手机号码。
        - `user[current_password]` (String, 可选): 当前密码（用于确认更改）。
- **Request示例:**

```
PUT /users HTTP/1.1
Host: localhost:3000
Accept: application/json
Content-Type: application/json

{
  "user": {
    "phone_number": "87654321",
    "current_password": "securepassword123"
  }
}
```

- **Response示例:**

```
{
  "id": 101,
  "email": "voter@example.com",
  "phone_number": "87654321",
  "updated_at": "2026-04-21T16:18:46Z"
}
```

**2.4 用户登出**

- **API名称:** 用户登出
- **简要描述:** 终止当前用户会话。
- **定义:**
    - **请求方法:** `DELETE`
    - **端点:** `/users/sign_out`
- **Request示例:**

```
DELETE /users/sign_out HTTP/1.1
Host: localhost:3000
Accept: application/json
```

- **Response示例:**

```
{
  "success": true,
  "message": "Signed out successfully."
}
```

