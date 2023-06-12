export interface BaresList {
  content: Bar[];
  pageable: Pageable;
  last: boolean;
  totalElements: number;
  totalPages: number;
  size: number;
  number: number;
  sort: Sort2;
  first: boolean;
  numberOfElements: number;
  empty: boolean;
}

export interface Bar {
  id: string;
  name: string;
  description: string;
  owner: Owner;
  address: string;
  comments: Comment[];
  image: string;
}

export interface Owner {
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

export interface Pageable {
  sort: Sort;
  offset: number;
  pageNumber: number;
  pageSize: number;
  paged: boolean;
  unpaged: boolean;
}

export interface Sort {
  empty: boolean;
  sorted: boolean;
  unsorted: boolean;
}

export interface Sort2 {
  empty: boolean;
  sorted: boolean;
  unsorted: boolean;
}


export interface BarRequest {
  name: string;
  description: string;
  address: string;
  images: string;
}
