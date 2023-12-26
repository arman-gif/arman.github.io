<?php

?>
<!DOCTYPE html>
<html>
<head>
  <title>Royal i-banking Ltd</title>
  <?php require 'assets/autoloader.php'; ?>
  <?php require 'assets/db.php'; ?>
  <?php require 'assets/function.php'; ?>
  <?php if (isset($_GET['delete'])) 
  {
    if ($con->query("delete from useraccounts where id = '$_GET[id]'"))
    {
      header("location:mindex.php");
    }
  } ?>
</head>
<body style="background-size: 100%" class="bg-gradient-seconday">




<?php
if (isset($_POST['saveAccount']))
{
  if (!$con->query("insert into useraccounts (name,cnic,accountNo,accountType,city,address,email,password,balance,source,number,branch,select_gender,issued_date,expiry_date,birth,district,nid_number,nname,nnid,nationality,occupation,authority,issued_state) values ('$_POST[name]','$_POST[cnic]','$_POST[accountNo]','$_POST[accountType]','$_POST[city]','$_POST[address]','$_POST[email]','$_POST[password]','$_POST[balance]','$_POST[source]','$_POST[number]','$_POST[branch]','$_POST[select_gender]','$_POST[birth]','$_POST[expiry_date]','$_POST[issued_date]','$_POST[nnid]','$_POST[nname]','$_POST[nid_number]','$_POST[district]','$_POST[nationality]','$_POST[occupation]','$_POST[authority]','$_POST[issued_state]')")) {
    echo "<div claass='alert alert-success'>Failed. Error is:".$con->error."</div>";
  }
  else
    echo "<div class='alert alert-info text-center'>Account added Successfully</div>";

}
if (isset($_GET['del']) && !empty($_GET['del']))
{
  $con->query("delete from login where id ='$_GET[del]'");
}
  
  
 ?>
<div class="container">
<div class="card w-100 text-center shadowBlue">
  <div class="card-header">
   New Account Forum
  </div>
  <div class="card-body bg-dark text-white">
    <table class="table">
      <tbody>
        <tr>
          <form method="POST">
          <th>Name</th>
          <td><input type="text" name="name" class="form-control input-sm" required></td>
          <th>CNIC</th>
          <td><input type="number" name="cnic" class="form-control input-sm" required></td>
        </tr>
        <tr>
          <th>Account Number</th>
          <td><input type="" name="accountNo" class="form-control input-sm" required></td>
          <th>Account Type</th>
          <td>
            <select class="form-control input-sm" name="accountType" required>
              <option value="current" selected>Current</option>
              <option value="saving" selected>Saving</option>
            </select>
          </td>
        </tr>
        <tr>
          <th>City</th>
          <td><input type="text" name="city" class="form-control input-sm" required></td>
          <th>Address</th>
          <td><input type="text" name="address" class="form-control input-sm" required></td>
        </tr>
        <tr>
          <th>Email</th>
          <td><input type="email" name="email" class="form-control input-sm" required></td>
          <th>Password</th>
          <td><input type="password" name="password" class="form-control input-sm" required></td>
        </tr>
        <tr>
          <th>Deposit</th>
          <td><input type="number" name="balance" min="500" class="form-control input-sm" required></td>
          <th>Source of income</th>
          <td><input type="text" name="source" class="form-control input-sm" required></td>
        </tr>
        <tr>
          <th>Nationality</th>
          <td><input type="text" name="nationality" min="500" class="form-control input-sm" required></td>
          <th>Occupation</th>
          <td><input type="text" name="occupation" class="form-control input-sm" required></td>
        </tr>
        <tr>
          <th>Issued Authority</th>
          <td><input type="text" name="authority" min="500" class="form-control input-sm" required></td>
          <th>Issued State</th>
          <td><input type="text" name="issued_state" class="form-control input-sm" required></td>
        </tr>
        <tr>
          <th>District</th>
          <td><input type="text" name="district" min="500" class="form-control input-sm" required></td>
          <th>Nid Number</th>
          <td><input type="number" name="nid_number" class="form-control input-sm" required></td>
        </tr>
        <tr>
          <th>Nominee Name</th>
          <td><input type="text" name="nname" min="500" class="form-control input-sm" required></td>
          <th>Nominee NID Number</th>
          <td><input type="number" name="nnid" class="form-control input-sm" required></td>
        </tr>
        <tr>
          <th>Issued Date</th>
          <td><input type="date" name="issued_date" min="500" class="form-control input-sm" required></td>
          <th>Expiry Date</th>
          <td><input type="date" name="expiry_date" class="form-control input-sm" required></td>
        </tr>
        <tr>
          <th>Birth</th>
          <td><input type="date" name="birth" min="500" class="form-control input-sm" required></td>
          <th>Select Gender</th>
          <td>
          <select name="select_gender" required class="form-control input-sm">
              <option selected value="">Please Select..</option>
              <option>Male</option>
              <option>Female</option>
              <option>Others</option>
          </select>
          </td>
        </tr>
        <tr>
          <th>Contact Number</th>
          <td><input type="number" name="number"  class="form-control input-sm" required></td>
          <th>Branch</th>
          <td>
            <select name="branch" required class="form-control input-sm">
              <option selected value="">Please Select..</option>
              <?php 
                $arr = $con->query("select * from branch");
                if ($arr->num_rows > 0)
                {
                  while ($row = $arr->fetch_assoc())
                  {
                    echo "<option value='$row[branchId]'>$row[branchName]</option>";
                  }
                }
                else
                  echo "<option value='1'>Main Branch</option>";
               ?>
            </select>
          </td>
        </tr>
        <tr>
          <td colspan="4">
            <button type="submit" name="saveAccount" class="btn btn-primary btn-sm">Save Account</button>
            <button type="Reset" class="btn btn-secondary btn-sm">Reset</button><br><br>
            <p> already have an account? <a href="login.php"> login now </a> </p>
         </form>

          </td>
        </tr>
      </tbody>
    </table>
    

  </div>
  <div class="card-footer text-muted">
    <?php echo bankname; ?>
  </div>
</div>


</body>
</html>