import { Bar } from "./bares.interface";

export interface LoginResponse {
  id: string;
  username: string;
  fullName: string;
  email: string;
  roles: string[];
  favList: Bar[];
  createdAt: string;
  token: string;
}

export interface LoginRequest {
  username: string;
  password: string;
}

export interface RegisterRequest {
  email: string;
  username: string;
  password: string;
  verifyPassword: string;
  fullName: string;
}


