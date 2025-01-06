Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 285711DF964
	for <linux-coco@lists.linux.dev>; Mon,  6 Jan 2025 18:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736186516; cv=none; b=ZjRcgQSRd15j8Th7I0+ylA9yYKTCL7O749f8V7vY2GoZif/D0IgoZTYFhxEnEcjvcCaN7o8TgukVP41JBgJLqnGNXErdpTSc6iXPqMM+KwUIClO4IQ15wRDjG2s5dgNiK+cV05Cp6IMF47BNiFv9dgEk7X+evTuaS1e86zPL9Cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736186516; c=relaxed/simple;
	bh=77OXqK1pKE5Qhz3fFWo9TL5w6JvaXL4k4udFV+Qafm0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hgt6JvOXDjVdPXoTjlHCV2IlHpWaTBw3PXH09GAqln2k4A8LXK+MfjxcLjvuuAgFWCl2XOZG9a/919/0RfUrWfnGmMcjmGgM/7AkOmDDwmJZyxwtEzwf6PxqFC/D0y35jbWs0uj8X+ybt5ACbb+ftLZiCYlHKbu5Zw9sVbMRrtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nXkDeoxF; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nXkDeoxF"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3862ca8e0bbso11189413f8f.0
        for <linux-coco@lists.linux.dev>; Mon, 06 Jan 2025 10:01:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736186509; x=1736791309; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WOea4FiJf5jFP+FBoTJLXb4Mg+OFZZLzUoREPDbNIys=;
        b=nXkDeoxFTprPXeI+59E51xBU3JTWPNB8gDSs5rtBSC1BEMkg1rPe3JgLN/zKYtDWQ9
         TKjtV0Uua1+5geh+DFv2gIVvqhdsQSnlcpLskvikONvqemnQvN/Uk35azK2gHhJjDyCS
         njb1YWiMDCLBqUSU+lq3dt1Bl1PS7BGKVMQ7NI5Q0Mu2Bz/7Oc7NReXGHzTG2YSFB9Pl
         QhvOjv93IyBpnGWWdfLctMGBVLYrfcgvrJJpeq1C6JqSybor7DBR8j7CzkwVJSCPf2nH
         ACO+d0xS6NiwYreLGdfQqzGq96PVlGW1HuQ92GNFAO9G9ZUq8AaptNaWLb6fWkqo7PQ6
         zBBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736186509; x=1736791309;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WOea4FiJf5jFP+FBoTJLXb4Mg+OFZZLzUoREPDbNIys=;
        b=L7zvYbjmA7fI1KriVpwmCep176WbFpI7zAwq6nAKI6ajRd7frSASuljwZJDSYoutHs
         sByhyuI4awrEMI5AA7hxET9qiU7LOCJhkxQ6eTgMQYZ/yp/3ixKIDL6lsn3wtkoo8/b8
         W2hZ+KW1trT94G4eOmy/Eccc1aWt84OuS4DwCoB8mahF7kW3pUSDXZU61OD4ss9a4D3I
         Blkg+fRHySGuxWdFDS07cTn5xi0r+e02ZzUm+D+FzRWKcClwtQTi/YSsXUshaxos+iX7
         4I7Plr9PCwkobwMyUxISqJYx0MaK9TRRRFK5e+Z7yMNg6K1EBS5HNSGkyMmuIeFCWzzN
         XuAA==
X-Forwarded-Encrypted: i=1; AJvYcCXlbsTX4wrBuvjqBdyBhPCygT5/2zgUDHxg6X0g9UkI7YCgTtKWR+a2ZkoK5aBp7AKPoY8cMd8AywZn@lists.linux.dev
X-Gm-Message-State: AOJu0YyKZ/b1VoPYrK8mHlh9xGKDxdoR2gunUkYKw/CYfSV8eebpnXj7
	MlM75oWViIFXM8wzJpdklU2k9acyPkUrQjYTx3E1Rz1UnVB7I4HaxTz3xsdhbcdmUEAS/n3fVMB
	LGojvEqK2Laqj5fCNERM5zJWRjLaXhnTw9/Xi
X-Gm-Gg: ASbGnct3YfjHbqYg43PIG6zY+o+PrNQUh+wOTS5ve33rQ5qOpgCf/FH4lcoX7NR+F/l
	5OrHimf6CvT5P/2x1Ig8LPA8KvZ8tDCfuq8bEJx4=
X-Google-Smtp-Source: AGHT+IESCI03OpkPkfTFwaEJUW0BCG2OZYodV/hDOXLIouNvo1C46024+Ks+lzSVWSK6DKJw6zI+HCS/UvPXkGqL3Jk=
X-Received: by 2002:adf:979c:0:b0:38a:418e:1179 with SMTP id
 ffacd0b85a97d-38a418e13dbmr26298987f8f.2.1736186509233; Mon, 06 Jan 2025
 10:01:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1735931639.git.ashish.kalra@amd.com> <be4d4068477c374ca6aa5b173dc1ee46ca5af44d.1735931639.git.ashish.kalra@amd.com>
In-Reply-To: <be4d4068477c374ca6aa5b173dc1ee46ca5af44d.1735931639.git.ashish.kalra@amd.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Mon, 6 Jan 2025 10:01:38 -0800
X-Gm-Features: AbW1kvYj-mHzoyLJ30Sfn2MLHF19btXX7kn-mo__fDMAb455VbeUvb-GfQRuYT8
Message-ID: <CAAH4kHaxpATK_dULAe67pV_k=r2LzFZrGn7pspQ2Bw0cUwo+kQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] crypto: ccp: Fix implicit SEV/SNP init and
 shutdown in ioctls
To: Ashish Kalra <Ashish.Kalra@amd.com>
Cc: seanjc@google.com, pbonzini@redhat.com, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	hpa@zytor.com, thomas.lendacky@amd.com, john.allen@amd.com, 
	herbert@gondor.apana.org.au, davem@davemloft.net, michael.roth@amd.com, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 3, 2025 at 12:00=E2=80=AFPM Ashish Kalra <Ashish.Kalra@amd.com>=
 wrote:
>
> From: Ashish Kalra <ashish.kalra@amd.com>
>

The subject includes "Fix" but has no "Fixes" tag in the commit message.

> Modify the behavior of implicit SEV initialization in some of the
> SEV ioctls to do both SEV initialization and shutdown and adds
> implicit SNP initialization and shutdown to some of the SNP ioctls
> so that the change of SEV/SNP platform initialization not being
> done during PSP driver probe time does not break userspace tools
> such as sevtool, etc.
>

It would be helpful to update the description with the state machine
you're trying to maintain implicitly.
I think that this changes the uapi contract as well, so I think you
need to update the documentation.

You have SEV shutdown on error for platform maintenance ioctls here,
which already have implicit init.
pdh_export gets an init if not in the init state, which wasn't already
implicit because there's a wrinkle WRT the writability permission.

snp_platform_status, snp_config, vlek_load, snp_commit now should be
callable any time, not just when KVM has initialized SNP? If there's a
caveat to the platform status, the docs need to reflect it.
I don't know how SNP_COMMIT makes sense as having an implicit
init/shutdown unless you're using it as SET_CONFIG, but I suppose it
doesn't hurt?

> Signed-off-by: Ashish Kalra <ashish.kalra@amd.com>
> ---
>  drivers/crypto/ccp/sev-dev.c | 149 +++++++++++++++++++++++++++++------
>  1 file changed, 125 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/crypto/ccp/sev-dev.c b/drivers/crypto/ccp/sev-dev.c
> index 1c1c33d3ed9a..0ec2e8191583 100644
> --- a/drivers/crypto/ccp/sev-dev.c
> +++ b/drivers/crypto/ccp/sev-dev.c
> @@ -1454,7 +1454,8 @@ static int sev_ioctl_do_platform_status(struct sev_=
issue_cmd *argp)
>  static int sev_ioctl_do_pek_pdh_gen(int cmd, struct sev_issue_cmd *argp,=
 bool writable)
>  {
>         struct sev_device *sev =3D psp_master->sev_data;
> -       int rc;
> +       bool shutdown_required =3D false;
> +       int rc, ret, error;
>
>         if (!writable)
>                 return -EPERM;
> @@ -1463,19 +1464,30 @@ static int sev_ioctl_do_pek_pdh_gen(int cmd, stru=
ct sev_issue_cmd *argp, bool wr
>                 rc =3D __sev_platform_init_locked(&argp->error);
>                 if (rc)
>                         return rc;
> +               shutdown_required =3D true;
> +       }
> +
> +       rc =3D __sev_do_cmd_locked(cmd, NULL, &argp->error);
> +
> +       if (shutdown_required) {
> +               ret =3D __sev_platform_shutdown_locked(&error);
> +               if (ret)
> +                       dev_err(sev->dev, "SEV: failed to SHUTDOWN error =
%#x, rc %d\n",
> +                               error, ret);
>         }
>
> -       return __sev_do_cmd_locked(cmd, NULL, &argp->error);
> +       return rc;
>  }
>
>  static int sev_ioctl_do_pek_csr(struct sev_issue_cmd *argp, bool writabl=
e)
>  {
>         struct sev_device *sev =3D psp_master->sev_data;
>         struct sev_user_data_pek_csr input;
> +       bool shutdown_required =3D false;
>         struct sev_data_pek_csr data;
>         void __user *input_address;
> +       int ret, rc, error;
>         void *blob =3D NULL;
> -       int ret;
>
>         if (!writable)
>                 return -EPERM;
> @@ -1506,6 +1518,7 @@ static int sev_ioctl_do_pek_csr(struct sev_issue_cm=
d *argp, bool writable)
>                 ret =3D __sev_platform_init_locked(&argp->error);
>                 if (ret)
>                         goto e_free_blob;
> +               shutdown_required =3D true;
>         }
>
>         ret =3D __sev_do_cmd_locked(SEV_CMD_PEK_CSR, &data, &argp->error)=
;
> @@ -1524,6 +1537,13 @@ static int sev_ioctl_do_pek_csr(struct sev_issue_c=
md *argp, bool writable)
>         }
>
>  e_free_blob:
> +       if (shutdown_required) {
> +               rc =3D __sev_platform_shutdown_locked(&error);
> +               if (rc)
> +                       dev_err(sev->dev, "SEV: failed to SHUTDOWN error =
%#x, rc %d\n",
> +                               error, rc);
> +       }
> +
>         kfree(blob);
>         return ret;
>  }
> @@ -1739,8 +1759,9 @@ static int sev_ioctl_do_pek_import(struct sev_issue=
_cmd *argp, bool writable)
>         struct sev_device *sev =3D psp_master->sev_data;
>         struct sev_user_data_pek_cert_import input;
>         struct sev_data_pek_cert_import data;
> +       bool shutdown_required =3D false;
>         void *pek_blob, *oca_blob;
> -       int ret;
> +       int ret, rc, error;
>
>         if (!writable)
>                 return -EPERM;
> @@ -1772,11 +1793,19 @@ static int sev_ioctl_do_pek_import(struct sev_iss=
ue_cmd *argp, bool writable)
>                 ret =3D __sev_platform_init_locked(&argp->error);
>                 if (ret)
>                         goto e_free_oca;
> +               shutdown_required =3D true;
>         }
>
>         ret =3D __sev_do_cmd_locked(SEV_CMD_PEK_CERT_IMPORT, &data, &argp=
->error);
>
>  e_free_oca:
> +       if (shutdown_required) {
> +               rc =3D __sev_platform_shutdown_locked(&error);
> +               if (rc)
> +                       dev_err(sev->dev, "SEV: failed to SHUTDOWN error =
%#x, rc %d\n",
> +                               error, rc);
> +       }
> +
>         kfree(oca_blob);
>  e_free_pek:
>         kfree(pek_blob);
> @@ -1893,17 +1922,8 @@ static int sev_ioctl_do_pdh_export(struct sev_issu=
e_cmd *argp, bool writable)
>         struct sev_data_pdh_cert_export data;
>         void __user *input_cert_chain_address;
>         void __user *input_pdh_cert_address;
> -       int ret;
> -
> -       /* If platform is not in INIT state then transition it to INIT. *=
/
> -       if (sev->state !=3D SEV_STATE_INIT) {
> -               if (!writable)
> -                       return -EPERM;
> -
> -               ret =3D __sev_platform_init_locked(&argp->error);
> -               if (ret)
> -                       return ret;
> -       }
> +       bool shutdown_required =3D false;
> +       int ret, rc, error;
>
>         if (copy_from_user(&input, (void __user *)argp->data, sizeof(inpu=
t)))
>                 return -EFAULT;
> @@ -1944,6 +1964,16 @@ static int sev_ioctl_do_pdh_export(struct sev_issu=
e_cmd *argp, bool writable)
>         data.cert_chain_len =3D input.cert_chain_len;
>
>  cmd:
> +       /* If platform is not in INIT state then transition it to INIT. *=
/
> +       if (sev->state !=3D SEV_STATE_INIT) {
> +               if (!writable)
> +                       return -EPERM;
> +               ret =3D __sev_platform_init_locked(&argp->error);
> +               if (ret)
> +                       goto e_free_cert;
> +               shutdown_required =3D true;
> +       }
> +
>         ret =3D __sev_do_cmd_locked(SEV_CMD_PDH_CERT_EXPORT, &data, &argp=
->error);
>
>         /* If we query the length, FW responded with expected data. */
> @@ -1970,6 +2000,13 @@ static int sev_ioctl_do_pdh_export(struct sev_issu=
e_cmd *argp, bool writable)
>         }
>
>  e_free_cert:
> +       if (shutdown_required) {
> +               rc =3D __sev_platform_shutdown_locked(&error);
> +               if (rc)
> +                       dev_err(sev->dev, "SEV: failed to SHUTDOWN error =
%#x, rc %d\n",
> +                               error, rc);
> +       }
> +
>         kfree(cert_blob);
>  e_free_pdh:
>         kfree(pdh_blob);
> @@ -1979,12 +2016,13 @@ static int sev_ioctl_do_pdh_export(struct sev_iss=
ue_cmd *argp, bool writable)
>  static int sev_ioctl_do_snp_platform_status(struct sev_issue_cmd *argp)
>  {
>         struct sev_device *sev =3D psp_master->sev_data;
> +       bool shutdown_required =3D false;
>         struct sev_data_snp_addr buf;
>         struct page *status_page;
> +       int ret, rc, error;
>         void *data;
> -       int ret;
>
> -       if (!sev->snp_initialized || !argp->data)
> +       if (!argp->data)
>                 return -EINVAL;
>
>         status_page =3D alloc_page(GFP_KERNEL_ACCOUNT);
> @@ -1993,6 +2031,13 @@ static int sev_ioctl_do_snp_platform_status(struct=
 sev_issue_cmd *argp)
>
>         data =3D page_address(status_page);
>
> +       if (!sev->snp_initialized) {
> +               ret =3D __sev_snp_init_locked(&argp->error);
> +               if (ret)
> +                       goto cleanup;
> +               shutdown_required =3D true;
> +       }
> +
>         /*
>          * Firmware expects status page to be in firmware-owned state, ot=
herwise
>          * it will report firmware error code INVALID_PAGE_STATE (0x1A).
> @@ -2021,6 +2066,13 @@ static int sev_ioctl_do_snp_platform_status(struct=
 sev_issue_cmd *argp)
>                 ret =3D -EFAULT;
>
>  cleanup:
> +       if (shutdown_required) {
> +               rc =3D __sev_snp_shutdown_locked(&error, false);
> +               if (rc)
> +                       dev_err(sev->dev, "SEV-SNP: failed to SHUTDOWN er=
ror %#x, rc %d\n",
> +                               error, rc);
> +       }
> +
>         __free_pages(status_page, 0);
>         return ret;
>  }
> @@ -2029,21 +2081,38 @@ static int sev_ioctl_do_snp_commit(struct sev_iss=
ue_cmd *argp)
>  {
>         struct sev_device *sev =3D psp_master->sev_data;
>         struct sev_data_snp_commit buf;
> +       bool shutdown_required =3D false;
> +       int ret, rc, error;
>
> -       if (!sev->snp_initialized)
> -               return -EINVAL;
> +       if (!sev->snp_initialized) {
> +               ret =3D __sev_snp_init_locked(&argp->error);
> +               if (ret)
> +                       return ret;
> +               shutdown_required =3D true;
> +       }
>
>         buf.len =3D sizeof(buf);
>
> -       return __sev_do_cmd_locked(SEV_CMD_SNP_COMMIT, &buf, &argp->error=
);
> +       ret =3D __sev_do_cmd_locked(SEV_CMD_SNP_COMMIT, &buf, &argp->erro=
r);
> +
> +       if (shutdown_required) {
> +               rc =3D __sev_snp_shutdown_locked(&error, false);
> +               if (rc)
> +                       dev_err(sev->dev, "SEV-SNP: failed to SHUTDOWN er=
ror %#x, rc %d\n",
> +                               error, rc);
> +       }
> +
> +       return ret;
>  }
>
>  static int sev_ioctl_do_snp_set_config(struct sev_issue_cmd *argp, bool =
writable)
>  {
>         struct sev_device *sev =3D psp_master->sev_data;
>         struct sev_user_data_snp_config config;
> +       bool shutdown_required =3D false;
> +       int ret, rc, error;
>
> -       if (!sev->snp_initialized || !argp->data)
> +       if (!argp->data)
>                 return -EINVAL;
>
>         if (!writable)
> @@ -2052,17 +2121,34 @@ static int sev_ioctl_do_snp_set_config(struct sev=
_issue_cmd *argp, bool writable
>         if (copy_from_user(&config, (void __user *)argp->data, sizeof(con=
fig)))
>                 return -EFAULT;
>
> -       return __sev_do_cmd_locked(SEV_CMD_SNP_CONFIG, &config, &argp->er=
ror);
> +       if (!sev->snp_initialized) {
> +               ret =3D __sev_snp_init_locked(&argp->error);
> +               if (ret)
> +                       return ret;
> +               shutdown_required =3D true;
> +       }
> +
> +       ret =3D __sev_do_cmd_locked(SEV_CMD_SNP_CONFIG, &config, &argp->e=
rror);
> +
> +       if (shutdown_required) {
> +               rc =3D __sev_snp_shutdown_locked(&error, false);
> +               if (rc)
> +                       dev_err(sev->dev, "SEV-SNP: failed to SHUTDOWN er=
ror %#x, rc %d\n",
> +                               error, rc);
> +       }
> +
> +       return ret;
>  }
>
>  static int sev_ioctl_do_snp_vlek_load(struct sev_issue_cmd *argp, bool w=
ritable)
>  {
>         struct sev_device *sev =3D psp_master->sev_data;
>         struct sev_user_data_snp_vlek_load input;
> +       bool shutdown_required =3D false;
> +       int ret, rc, error;
>         void *blob;
> -       int ret;
>
> -       if (!sev->snp_initialized || !argp->data)
> +       if (!argp->data)
>                 return -EINVAL;
>
>         if (!writable)
> @@ -2081,8 +2167,23 @@ static int sev_ioctl_do_snp_vlek_load(struct sev_i=
ssue_cmd *argp, bool writable)
>
>         input.vlek_wrapped_address =3D __psp_pa(blob);
>
> +       if (!sev->snp_initialized) {
> +               ret =3D __sev_snp_init_locked(&argp->error);
> +               if (ret)
> +                       goto cleanup;
> +               shutdown_required =3D true;
> +       }
> +
>         ret =3D __sev_do_cmd_locked(SEV_CMD_SNP_VLEK_LOAD, &input, &argp-=
>error);
>
> +       if (shutdown_required) {
> +               rc =3D __sev_snp_shutdown_locked(&error, false);
> +               if (rc)
> +                       dev_err(sev->dev, "SEV-SNP: failed to SHUTDOWN er=
ror %#x, rc %d\n",
> +                               error, rc);
> +       }
> +
> +cleanup:
>         kfree(blob);
>
>         return ret;
> --
> 2.34.1
>


--
-Dionna Glaze, PhD, CISSP, CCSP (she/her)
