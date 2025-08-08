use anchor_lang::prelude::*;

//declare_id!("Bz2g5fUHJZ5Tv96Ao2ZGJLhBV7zUYapDH5HA7SBGQA6x");
declare_id!("22222222222222222222222222222222222222222222");

#[program]
pub mod blueshift_anchor_vault {
    use super::*;

    pub fn deposit(ctx: Context<VaultAction>, amount: u64) -> Result<()> {
        
        Ok(())
    }
 
    pub fn withdraw(ctx: Context<VaultAction>) -> Result<()> {
        
        Ok(())
    }
}

#[derive(Accounts)]
pub struct VaultAction<'info> {
    #[account(mut)]
    pub signer: Signer<'info>,
    #[account(
        mut,
        seeds = [b"vault", signer.key().as_ref()],
        bump,
    )]
    pub vault: SystemAccount<'info>,
    pub system_program: Program<'info, System>,
}
 
#[error_code]
pub enum VaultError {
    #[msg("Vault already exists")]
    VaultAlreadyExists,
    #[msg("Invalid amount")]
    InvalidAmount,
}
