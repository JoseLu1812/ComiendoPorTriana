import { Component, Input } from '@angular/core';
import { LoginRequest } from 'src/app/interfaces/login.interface';
import { AuthService } from 'src/app/services/auth.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css'],
})
export class LoginComponent{
  @Input()
  username: string = '';
  @Input()
  password: string = '';

  request: LoginRequest = {} as LoginRequest;

  constructor(private authService: AuthService) { }

  onSubmit() {
    this.request.username = this.username;
    this.request.password = this.password;
    this.authService.login(this.request);
    
  }


}
