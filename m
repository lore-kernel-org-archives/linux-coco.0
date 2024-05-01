Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7AF84E15
	for <linux-coco@lists.linux.dev>; Wed,  1 May 2024 23:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714607865; cv=none; b=TLxqpem3/OaNx4vUcDueCAzkmhuM1WhxJ4hsqsGh5qEcDkLF7Qx6VyT45CNZA7dt8amDArW40KQzVz5+Zqx/tmEer9D34vhTTzKk+3FnxvDE2fQuQsskzjD4yBAlzSsmehqsqaPVpLdnIZGDV4hGDeq9kYA+GS+vUW8YQEQsrhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714607865; c=relaxed/simple;
	bh=tdUVuA7cMU1nV3MAwXQdpMJ/834r7yATg96EdPenFhY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DcfxTfDtITHcHSOoW4LjX+q4zUktm04/4IQlsn6seVRTJdyAXzHeE4XwMD49OrDrXLsvF2Vctu/DY4FlFamsmdhLLG6drLu8dTIoo3+3EEQwzOzEwKTig3fkCI9PNWAA0eTWq6rY11HMC6sXj/vKIuant0GB9bM56Rpn59ljGz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1Z0GwCVx; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1Z0GwCVx"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1eb1cb1a8f1so43585ad.0
        for <linux-coco@lists.linux.dev>; Wed, 01 May 2024 16:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714607863; x=1715212663; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y3N9K9XYaKMGZdcDbk8zOnlfG31gz7F53PkNSPj7AWg=;
        b=1Z0GwCVxWaqSiM4K2+9rZ0GZaq+CDceohoULDjibStJsLr62MnnXM7B9/j5CDDGAw/
         lsW4CLMVjzr69wOOWUJnpwMKqj4G4D6p+KCXRqX1zBSAGt2xgcnv+9vOk4KO67vnMqPd
         wuq616tzTNzzr6MrSK/eLgjJVMvbkUHhiTalnrQEtHrXhBNC8ckect4tSJu6VPavD6mn
         fyUJYzdAB+dLsIECYTmKWO1c6GVBg/w7yEkE0azWviei6+Tqs8ZQ8csXmD6Lmshh51py
         SsJ/9J11BKc7V0nQAbJoRkR1X8JK6uHliXGBVmKGAP7DkL1TlT2eI2BQAZ3r5XZ/pv9U
         Rh+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714607863; x=1715212663;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y3N9K9XYaKMGZdcDbk8zOnlfG31gz7F53PkNSPj7AWg=;
        b=bZKFu9js0FytAsr7vHHkrL+l5UO8D9c1AREIwhVQMspIWeABAdB6xmnO0yIDlgz5A2
         ZoGFnLUP/b5a07XafVbX+nba7S682jnml6vmbYcvrwhV6JTOMi5Q6D/+K4ek1Qk6qpWi
         OZXqJR9kumDrUwaOM3fpeqMuatkYGkmoMPFW5zyHfxSeZJHHsxRl9tbiG22Yb6pX3UYJ
         UoYR6ZcaAFuOx16jiHlk62d+ks7TOWZv/CWqryHEvszpWXI1gap2GvZ/2If0n9hmuRcI
         BaTZtzbVlkeivkUw6X9TkZGuhb65fhIt993SmbI76k3EsBDOaKBCr7dE7RhvBdZ58Mky
         A8Aw==
X-Forwarded-Encrypted: i=1; AJvYcCV7Xf/x38nxZDHYhAVAKsbny7FWvyaL6F1fUjSOPmoR0uG7cYMdbrRtb9E/wQnWXJee3EQaniwz4sYnxWTcwpJAa9wzYQliC+gVAA==
X-Gm-Message-State: AOJu0Yw5mXAAU97T2IrVPV+wPcQRgjMkHZa9zkw2mwU3UwdMx/eIN3kq
	NrgDzjAB6LZZga1A/eW0Kplo2mKbF0F48Keex8cOYyA9aEpZ39QaRP8o+5ti9ycBSocUHlveMs5
	v8egUHXwPFLLNSnSNvhLXFeggkCApkGziuLIP
X-Google-Smtp-Source: AGHT+IGmRp2SaOfivxZsxyEmDpcfB05o8hMRnRqC2fQFkve9zcnaRe2WBjthHLk4u5rxl1MNyVU8KmeMrZ34wV1uZPc=
X-Received: by 2002:a17:902:da86:b0:1ea:963e:2e2d with SMTP id
 d9443c01a7336-1ecdcaa34b4mr1032405ad.24.1714607862435; Wed, 01 May 2024
 16:57:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1713974291.git.thomas.lendacky@amd.com> <b8508f57712e3194484aa8695494eea26abe1b73.1713974291.git.thomas.lendacky@amd.com>
In-Reply-To: <b8508f57712e3194484aa8695494eea26abe1b73.1713974291.git.thomas.lendacky@amd.com>
From: Jacob Xu <jacobhxu@google.com>
Date: Wed, 1 May 2024 16:57:31 -0700
Message-ID: <CAJ5mJ6gEd4SXtbhRhBowqVNgqqDspvtSC-NLPzNcoE=xHkZ6YQ@mail.gmail.com>
Subject: Re: [svsm-devel] [PATCH v4 10/15] virt: sev-guest: Choose the VMPCK
 key based on executing VMPL
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	svsm-devel@coconut-svsm.dev, Peter Zijlstra <peterz@infradead.org>, 
	Michael Roth <michael.roth@amd.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, 
	"H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Dan Williams <dan.j.williams@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

General question on VMPCKs: the secrets page defines them listed all
together one at a time, does that mean any guest at any VMPL can
observe all the VMPCKs? Or is SVSM running at VMPL0 supposed to clear
VMPCK0 before it hands off control to edk2?


On Wed, Apr 24, 2024 at 8:59=E2=80=AFAM Tom Lendacky <thomas.lendacky@amd.c=
om> wrote:
>
> Currently, the sev-guest driver uses the vmpck-0 key by default. When an
> SVSM is present the kernel is running at a VMPL other than 0 and the
> vmpck-0 key is no longer available. If a specific vmpck key has not be
> requested by the user via the vmpck_id module parameter, choose the vmpck
> key based on the active VMPL level.
>
> Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
> ---
>  arch/x86/include/asm/sev.h              |  2 ++
>  arch/x86/kernel/sev.c                   |  6 ++++++
>  drivers/virt/coco/sev-guest/sev-guest.c | 10 +++++++---
>  3 files changed, 15 insertions(+), 3 deletions(-)
>
> diff --git a/arch/x86/include/asm/sev.h b/arch/x86/include/asm/sev.h
> index a7312b936d16..64fcadd6d602 100644
> --- a/arch/x86/include/asm/sev.h
> +++ b/arch/x86/include/asm/sev.h
> @@ -307,6 +307,7 @@ u64 snp_get_unsupported_features(u64 status);
>  u64 sev_get_status(void);
>  void sev_show_status(void);
>  void snp_remap_svsm_ca(void);
> +int snp_get_vmpl(void);
>  #else
>  static inline void sev_es_ist_enter(struct pt_regs *regs) { }
>  static inline void sev_es_ist_exit(void) { }
> @@ -337,6 +338,7 @@ static inline u64 snp_get_unsupported_features(u64 st=
atus) { return 0; }
>  static inline u64 sev_get_status(void) { return 0; }
>  static inline void sev_show_status(void) { }
>  static inline void snp_remap_svsm_ca(void) { }
> +static inline int snp_get_vmpl(void) { return 0; }
>  #endif
>
>  #ifdef CONFIG_KVM_AMD_SEV
> diff --git a/arch/x86/kernel/sev.c b/arch/x86/kernel/sev.c
> index 8edf7362136b..75f11da867a3 100644
> --- a/arch/x86/kernel/sev.c
> +++ b/arch/x86/kernel/sev.c
> @@ -2454,6 +2454,12 @@ int snp_issue_guest_request(u64 exit_code, struct =
snp_req_data *input, struct sn
>  }
>  EXPORT_SYMBOL_GPL(snp_issue_guest_request);
>
> +int snp_get_vmpl(void)
> +{
> +       return vmpl;
> +}
> +EXPORT_SYMBOL_GPL(snp_get_vmpl);
> +
>  static struct platform_device sev_guest_device =3D {
>         .name           =3D "sev-guest",
>         .id             =3D -1,
> diff --git a/drivers/virt/coco/sev-guest/sev-guest.c b/drivers/virt/coco/=
sev-guest/sev-guest.c
> index 04a7bd1e4314..e7dd7df86427 100644
> --- a/drivers/virt/coco/sev-guest/sev-guest.c
> +++ b/drivers/virt/coco/sev-guest/sev-guest.c
> @@ -2,7 +2,7 @@
>  /*
>   * AMD Secure Encrypted Virtualization (SEV) guest driver interface
>   *
> - * Copyright (C) 2021 Advanced Micro Devices, Inc.
> + * Copyright (C) 2021-2024 Advanced Micro Devices, Inc.
>   *
>   * Author: Brijesh Singh <brijesh.singh@amd.com>
>   */
> @@ -70,8 +70,8 @@ struct snp_guest_dev {
>         u8 *vmpck;
>  };
>
> -static u32 vmpck_id;
> -module_param(vmpck_id, uint, 0444);
> +static int vmpck_id =3D -1;
> +module_param(vmpck_id, int, 0444);
>  MODULE_PARM_DESC(vmpck_id, "The VMPCK ID to use when communicating with =
the PSP.");
>
>  /* Mutex to serialize the shared buffer access and command handling. */
> @@ -923,6 +923,10 @@ static int __init sev_guest_probe(struct platform_de=
vice *pdev)
>         if (!snp_dev)
>                 goto e_unmap;
>
> +       /* Adjust the default VMPCK key based on the executing VMPL level=
 */
> +       if (vmpck_id =3D=3D -1)
> +               vmpck_id =3D snp_get_vmpl();
> +
>         ret =3D -EINVAL;
>         snp_dev->vmpck =3D get_vmpck(vmpck_id, layout, &snp_dev->os_area_=
msg_seqno);
>         if (!snp_dev->vmpck) {
> --
> 2.43.2
>
> --
> Svsm-devel mailing list
> Svsm-devel@coconut-svsm.dev
> https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel
