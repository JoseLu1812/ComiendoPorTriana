import { Bar } from "./bares.interface";

export type UseList = User[];

export interface User {
  id: string;
  username: string;
  password: string;
  email: string;
  fullName: string;
  favList: Bar[];
  accountNonExpired: boolean;
  accountNonLocked: boolean;
  credentialsNonExpired: boolean;
  enabled: boolean;
  roles: string[];
  createdAt: string;
  lastPasswordChangeAt: string;
  authorities: Authority[];
}

export interface Authority {
  authority: string;
}

