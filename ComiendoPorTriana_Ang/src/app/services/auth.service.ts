import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';
import { LoginRequest, RegisterRequest } from '../interfaces/login.interface';
import { environment } from 'src/environments/environment';
import { User } from '../interfaces/user.interface';


@Injectable({
  providedIn: 'root',
})
export class AuthService {
  private tokenSubject: BehaviorSubject<string | null> = new BehaviorSubject<
    string | null
  >(null);

  constructor(private http: HttpClient) {}

  login(request: LoginRequest) {
    return this.http
      .post<any>(`${environment.apiBaseUrl}auth/login`, request)
      .subscribe((resp) => {
        const token = resp.token;
        this.tokenSubject.next(token);
        return resp;
      });
  }

  getToken(): string | null {
    return this.tokenSubject.getValue();
  }

  registerUser(request: RegisterRequest) {
    return this.http.post<User>(
      `${environment.apiBaseUrl}auth/register/user`,
      request
    );
  }

  registerBarman(request: RegisterRequest) {
    return this.http.post<User>(
      `${environment.apiBaseUrl}auth/register/user`,
      request
    );
  }

  registerAdmin(request: RegisterRequest) {
    return this.http.post<User>(
      `${environment.apiBaseUrl}auth/register/user`,
      request
    );
  }
}
