import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { User } from '../interfaces/user.interface';


@Injectable({
  providedIn: 'root'
})
export class UserService {

  constructor(private http: HttpClient) { }

  getAllUsers(): Observable<User[]> {
    return this.http.get<User[]>(`${environment.apiBaseUrl}admin/users`);
  }

  getUserByUsername(username: string): Observable<User> {
    return this.http.get<User>(`${environment.apiBaseUrl}admin/users/${username}`);
  }

}
