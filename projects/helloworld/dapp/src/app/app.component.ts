import { Component } from '@angular/core';
import { ContractsService } from './contracts.service';
import { FormControl, FormGroup, ReactiveFormsModule } from '@angular/forms';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})

export class AppComponent {
  public balance: number;
  public creator: boolean;
  public cs: any;

  exampleForm = new FormGroup ({
    account1: new FormControl(),
    account2: new FormControl(),
    amount: new FormControl(),
  });

  constructor(cs: ContractsService) {
    this.cs = cs;
	cs.isCreator().then(creator => this.creator = creator);
    cs.getUserBalance().then(balance => this.balance = balance);
  }

  onSubmit() {
	console.warn(this.exampleForm.value);
  	this.cs.recordTransaction(this.exampleForm.value.account1, this.exampleForm.value.account2, this.exampleForm.value.amount)
  }

}
