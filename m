Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A6E11C00
	for <linux-coco@lists.linux.dev>; Tue, 21 Jun 2022 21:43:27 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id c30so17006388ljr.9
        for <linux-coco@lists.linux.dev>; Tue, 21 Jun 2022 14:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RaH322YAfZ65JMqhLFboGn96Qf6ZOePhsZrijH5KbCY=;
        b=D3/p22SjNtBkp5qEhE4PypZKC+l3FMV1mhcEN+p6jsNQhcEDuTDTjJxGGLOJxbogOF
         1hFTZ9BOEVKlgp02OsdyaGnv3jsasAPBa/Cnnn2ZVpnyiylHmg6eMVeg4UOWSS0+p6zX
         sdy+2066vX5/bbMcM3aRdbC1PfISSKXvU7NaQ/kzpQjqwI/qZveOUZN3ugQivMMRJkUd
         767YoEBbRRZIM8FyEma3DgNG5SB6FMsF8zbh96yzu29kt8zP32y8BNiGjtAdoKvgo2HK
         SJwOxxywLUJ1z091ovPz98tTKskg+w9ZxRTuR70p3dBhFgE3sxOSL5tGHMYs7Mh864Qz
         uO2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RaH322YAfZ65JMqhLFboGn96Qf6ZOePhsZrijH5KbCY=;
        b=fwS/0IRMpvx/sQGynUEFkpnyB43zt37DyOiAhc8ojudoLEON+ie3OZWFmsAsy/pHb7
         LuFbNImnpjpkC2EYQoxAeFJyth7O70915E9fmc7/B+KqrxftdGyJ/FgBiW8D5ZohTuKd
         b9Zq0B94DznWG9U8nzrSWN3e/MCP9NmoURaG6xHnodmjAkaUqBvNZ6TZsjOWS8aUs13t
         zwKPgeU+EmRJlmQpDeXZ/iEEEY6TNwfDBRQ+NNgh4ri5WGGFIi3InZ1JsW6F8yt2BZhA
         hYg3URGL4MHHx7vHDKnShAhApOcAX2JFK+FLr9PUdBoATQ2D5m3AXABpCl1VdfulkHVv
         tQgg==
X-Gm-Message-State: AJIora+JQ40nPxr/VfIYyuedlNbzdu6ZX/fB0MO4LcwiCWjBX3GUw1Mn
	ZxOx/oeCVg6StB5c1epcQHW3UcPlBqa3IFaEK7AZ6ofM1FpQeMhI
X-Google-Smtp-Source: AGRyM1t5LrtreIfpkqHvv2yWX9Y68V+SEkl3eaqcL/xXhjiBuz27iIjbUSSQa72Yfnt0/LC6HDLYtul7ha0wfZsOe5Q=
X-Received: by 2002:a2e:8805:0:b0:255:6e73:9a67 with SMTP id
 x5-20020a2e8805000000b002556e739a67mr91486ljh.426.1655847804879; Tue, 21 Jun
 2022 14:43:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1655761627.git.ashish.kalra@amd.com> <a63de5e687c530849312099ee02007089b67e92f.1655761627.git.ashish.kalra@amd.com>
In-Reply-To: <a63de5e687c530849312099ee02007089b67e92f.1655761627.git.ashish.kalra@amd.com>
From: Peter Gonda <pgonda@google.com>
Date: Tue, 21 Jun 2022 15:43:13 -0600
Message-ID: <CAMkAt6qL_p8Fp=ED5hER665GHzQn=nwZQhFg4MwHt7QanS4wVw@mail.gmail.com>
Subject: Re: [PATCH Part2 v6 13/49] crypto:ccp: Provide APIs to issue SEV-SNP commands
To: Ashish Kalra <Ashish.Kalra@amd.com>
Cc: "the arch/x86 maintainers" <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	kvm list <kvm@vger.kernel.org>, linux-coco@lists.linux.dev, linux-mm@kvack.org, 
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Joerg Roedel <jroedel@suse.de>, 
	"Lendacky, Thomas" <thomas.lendacky@amd.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Jim Mattson <jmattson@google.com>, Andy Lutomirski <luto@kernel.org>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Sergio Lopez <slp@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, 
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, David Rientjes <rientjes@google.com>, 
	Dov Murik <dovmurik@linux.ibm.com>, Tobin Feldman-Fitzthum <tobin@ibm.com>, Borislav Petkov <bp@alien8.de>, 
	Michael Roth <michael.roth@amd.com>, Vlastimil Babka <vbabka@suse.cz>, 
	"Kirill A . Shutemov" <kirill@shutemov.name>, Andi Kleen <ak@linux.intel.com>, 
	Tony Luck <tony.luck@intel.com>, Marc Orr <marcorr@google.com>, 
	Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	Alper Gun <alpergun@google.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>, jarkko@kernel.org
Content-Type: text/plain; charset="UTF-8"

(

On Mon, Jun 20, 2022 at 5:05 PM Ashish Kalra <Ashish.Kalra@amd.com> wrote:
>
> From: Brijesh Singh <brijesh.singh@amd.com>
>
> Provide the APIs for the hypervisor to manage an SEV-SNP guest. The
> commands for SEV-SNP is defined in the SEV-SNP firmware specification.
>
> Signed-off-by: Brijesh Singh <brijesh.singh@amd.com>
> ---
>  drivers/crypto/ccp/sev-dev.c | 24 ++++++++++++
>  include/linux/psp-sev.h      | 73 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 97 insertions(+)
>
> diff --git a/drivers/crypto/ccp/sev-dev.c b/drivers/crypto/ccp/sev-dev.c
> index f1173221d0b9..35d76333e120 100644
> --- a/drivers/crypto/ccp/sev-dev.c
> +++ b/drivers/crypto/ccp/sev-dev.c
> @@ -1205,6 +1205,30 @@ int sev_guest_df_flush(int *error)
>  }
>  EXPORT_SYMBOL_GPL(sev_guest_df_flush);
>
> +int snp_guest_decommission(struct sev_data_snp_decommission *data, int *error)
> +{
> +       return sev_do_cmd(SEV_CMD_SNP_DECOMMISSION, data, error);
> +}
> +EXPORT_SYMBOL_GPL(snp_guest_decommission);
> +
> +int snp_guest_df_flush(int *error)
> +{
> +       return sev_do_cmd(SEV_CMD_SNP_DF_FLUSH, NULL, error);
> +}
> +EXPORT_SYMBOL_GPL(snp_guest_df_flush);

Why not instead change sev_guest_df_flush() to be SNP aware? That way
callers get the right behavior without having to know if SNP is
enabled or not.

int sev_guest_df_flush(int *error)
{
  if (!psp_master || !psp_master->sev_data)
   return -EINVAL;

  if (psp_master->sev_data->snp_inited)
    return sev_do_cmd(SEV_CMD_SNP_DF_FLUSH, NULL, error);

  return sev_do_cmd(SEV_CMD_DF_FLUSH, NULL, error);
}

> +int snp_guest_page_reclaim(struct sev_data_snp_page_reclaim *data, int *error)
> +{
> +       return sev_do_cmd(SEV_CMD_SNP_PAGE_RECLAIM, data, error);
> +}
> +EXPORT_SYMBOL_GPL(snp_guest_page_reclaim);
> +
> +int snp_guest_dbg_decrypt(struct sev_data_snp_dbg *data, int *error)
> +{
> +       return sev_do_cmd(SEV_CMD_SNP_DBG_DECRYPT, data, error);
> +}
> +EXPORT_SYMBOL_GPL(snp_guest_dbg_decrypt);
> +
>  static void sev_exit(struct kref *ref)
>  {
>         misc_deregister(&misc_dev->misc);
> diff --git a/include/linux/psp-sev.h b/include/linux/psp-sev.h
> index ef4d42e8c96e..9f921d221b75 100644
> --- a/include/linux/psp-sev.h
> +++ b/include/linux/psp-sev.h
> @@ -881,6 +881,64 @@ int sev_guest_df_flush(int *error);
>   */
>  int sev_guest_decommission(struct sev_data_decommission *data, int *error);
>
> +/**
> + * snp_guest_df_flush - perform SNP DF_FLUSH command
> + *
> + * @sev_ret: sev command return code
> + *
> + * Returns:
> + * 0 if the sev successfully processed the command
> + * -%ENODEV    if the sev device is not available
> + * -%ENOTSUPP  if the sev does not support SEV
> + * -%ETIMEDOUT if the sev command timed out
> + * -%EIO       if the sev returned a non-zero return code
> + */
> +int snp_guest_df_flush(int *error);
> +
> +/**
> + * snp_guest_decommission - perform SNP_DECOMMISSION command
> + *
> + * @decommission: sev_data_decommission structure to be processed
> + * @sev_ret: sev command return code
> + *
> + * Returns:
> + * 0 if the sev successfully processed the command
> + * -%ENODEV    if the sev device is not available
> + * -%ENOTSUPP  if the sev does not support SEV
> + * -%ETIMEDOUT if the sev command timed out
> + * -%EIO       if the sev returned a non-zero return code
> + */
> +int snp_guest_decommission(struct sev_data_snp_decommission *data, int *error);
> +
> +/**
> + * snp_guest_page_reclaim - perform SNP_PAGE_RECLAIM command
> + *
> + * @decommission: sev_snp_page_reclaim structure to be processed
> + * @sev_ret: sev command return code
> + *
> + * Returns:
> + * 0 if the sev successfully processed the command
> + * -%ENODEV    if the sev device is not available
> + * -%ENOTSUPP  if the sev does not support SEV
> + * -%ETIMEDOUT if the sev command timed out
> + * -%EIO       if the sev returned a non-zero return code
> + */
> +int snp_guest_page_reclaim(struct sev_data_snp_page_reclaim *data, int *error);
> +
> +/**
> + * snp_guest_dbg_decrypt - perform SEV SNP_DBG_DECRYPT command
> + *
> + * @sev_ret: sev command return code
> + *
> + * Returns:
> + * 0 if the sev successfully processed the command
> + * -%ENODEV    if the sev device is not available
> + * -%ENOTSUPP  if the sev does not support SEV
> + * -%ETIMEDOUT if the sev command timed out
> + * -%EIO       if the sev returned a non-zero return code
> + */
> +int snp_guest_dbg_decrypt(struct sev_data_snp_dbg *data, int *error);
> +
>  void *psp_copy_user_blob(u64 uaddr, u32 len);
>
>  #else  /* !CONFIG_CRYPTO_DEV_SP_PSP */
> @@ -908,6 +966,21 @@ sev_issue_cmd_external_user(struct file *filep, unsigned int id, void *data, int
>
>  static inline void *psp_copy_user_blob(u64 __user uaddr, u32 len) { return ERR_PTR(-EINVAL); }
>
> +static inline int
> +snp_guest_decommission(struct sev_data_snp_decommission *data, int *error) { return -ENODEV; }
> +
> +static inline int snp_guest_df_flush(int *error) { return -ENODEV; }
> +
> +static inline int snp_guest_page_reclaim(struct sev_data_snp_page_reclaim *data, int *error)
> +{
> +       return -ENODEV;
> +}
> +
> +static inline int snp_guest_dbg_decrypt(struct sev_data_snp_dbg *data, int *error)
> +{
> +       return -ENODEV;
> +}
> +
>  #endif /* CONFIG_CRYPTO_DEV_SP_PSP */
>
>  #endif /* __PSP_SEV_H__ */
> --
> 2.25.1
>
