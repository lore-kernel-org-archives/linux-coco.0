Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B90225E806
	for <linux-coco@lists.linux.dev>; Tue, 25 Mar 2025 16:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742921829; cv=none; b=RoWEYXqWhLkTXO99Cj3WH07VSwTq3OVvWQmy5OSLn0XJexEp1bWL5fNVv39R5PY+qlacLpi1IJp/0tHfCBmhL2kfh+6fLlOJozk08Mawva/T/7AhP84M9hWeZ5VGiy0rLfSZlT57kpY+qMtOuboB594ZF8GnCE2pIBXjD52foFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742921829; c=relaxed/simple;
	bh=DHhaVcWokcmNeyMpAa/XPyVDS1B8ctys936Gog/i6Qk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EhW2MUfDlHETqRpsBZZ5Qvr/iOcMpGMqcJnESkK9VMredQ+b9UfPAq4zblzjbPvADLbH/0JPa66IV5OaYCHjvGfi+bJ9pF0V3zGZKOJnkdakevXEs4gCACklqbSrWcVYwchFKB0a+ZDBQ8dX53KOKIAFEVFfFmP2Nb8rR2s5neE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Q1sPNjau; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Q1sPNjau"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ac3b12e8518so76160366b.0
        for <linux-coco@lists.linux.dev>; Tue, 25 Mar 2025 09:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742921825; x=1743526625; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LHR6o7AHPoVcL3mifFoOecu+bkyOlN7e6JWMVln9ejU=;
        b=Q1sPNjauI7YsjBjRw5zVs0lHVV2kfszYCpT1A/5CBuINe03SYCQ4EEB3YLPUXNj0lx
         N3MfBUEaM/e6Xs9sdhs07GAKM5MVx9dw9VTBin6eYx0FCndOc0DGIKQeg6i5qg8c7J4K
         76O+oG74e2fbpa03pi/bqerSy9fKMuyybZg9uPDkuBIQUQMyskX91h0ZhJjSNwkHkZWl
         svfA3fU6cyWtNsASbXbWbeLjQ//KMjjSLMML1CetV/Wxc2Th5nrI38ihdGMT4APP83ym
         Y0nYzty8pz+N20aLjWEo8jylivUoNML8Rye9U4h8vHtJSOkC4lz0APZI9E66tB0nYesU
         z90A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742921825; x=1743526625;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LHR6o7AHPoVcL3mifFoOecu+bkyOlN7e6JWMVln9ejU=;
        b=A+dk6MRZP7H2+Gv+A+rja4x+sppp665mJjMczGfoZZCNrVB5NkNF/X+EvVkLuSzZHr
         radQhC3qs3fZ9co4p3xGn7k2pH1yjgwaY/gHDAvquAWSVZx73jZ99GvA/IPuRMMoAx5Y
         mPTzEz8g4pmx0bZ6cw61HBcFMvbYbisxpZ/JyCpawlrLO7rFWjjYnGZP036SgnBVIHcQ
         BfdCndWwuCtaVFaagebIY89NSE7lEOM+a/uSoEKoTAMM2KsKD1Xt0If1ctuSdgZ771PE
         AyCKAzXVNUr8WZczwROeXf1KoyAVJjdpf/3rtaVmeVFAT19SGYh4lGtOZZ9d7zxlbVKP
         ifCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJ52z933+c6RZzG48oATLwX2hSK4JwuF6YETKREbZlpIEOEzGiP35O3wyRx70hbg9pgItsFtzwix/0@lists.linux.dev
X-Gm-Message-State: AOJu0Ywj45zpKvspPX+Nyjh9iFsdaf2+A4zdxGu8N7uQfTVZX9rvxj/c
	jK+67YnrRbiWkXmlY79BvQYVVwvxD2Mkb/Xy8YbW4j7IkDSxOiQfv2SY/nnVtGnO0j9Nk4RwLh9
	+V7Wtfx4ybVK05n9l2yutGSs/J/wj7gDqxATq
X-Gm-Gg: ASbGncs1g5KVGp+73hYauObc9tANlT3FfqOVJeufznwoh4DlkZP9cjp6aixxRkHcLRv
	MMf9+8Bme0lwvM6Jlj5fcDEHG5+VYFUaGavRwrzX1uMnkBmMEZzwdGgjyWfjBtyOrV9d2aDWq22
	VR36eejIFCjvrGnar1twBd9ABd
X-Google-Smtp-Source: AGHT+IHiunbDy64QKJ1rFHvrWPJFtkT3kS/DMJaMWqheAGqvq3asfLSavmh0zFHfePK2DFNi4vOT1uYNczRGYC1UgDA=
X-Received: by 2002:a17:907:720c:b0:ab7:1012:3ccb with SMTP id
 a640c23a62f3a-ac3f20d2423mr1450323266b.14.1742921825236; Tue, 25 Mar 2025
 09:57:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250324104653.138663-1-sgarzare@redhat.com> <20250324104653.138663-2-sgarzare@redhat.com>
In-Reply-To: <20250324104653.138663-2-sgarzare@redhat.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Tue, 25 Mar 2025 09:56:53 -0700
X-Gm-Features: AQ5f1JpVbwWqpNDbKaceDrU7STOlxFC1ra_fhrwK0XiBE_U6_DZfkH_Wo5bMXgQ
Message-ID: <CAAH4kHYuaQEkvftWuX+UmGDiAgV5i1uHx8=rjmhJ0Y=inQFw-Q@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] x86/sev: add SVSM vTPM probe/send_command functions
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: Jarkko Sakkinen <jarkko@kernel.org>, Joerg Roedel <jroedel@suse.de>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Peter Huewe <peterhuewe@gmx.de>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Thomas Gleixner <tglx@linutronix.de>, x86@kernel.org, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, linux-kernel@vger.kernel.org, 
	Borislav Petkov <bp@alien8.de>, Jason Gunthorpe <jgg@ziepe.ca>, "H. Peter Anvin" <hpa@zytor.com>, 
	linux-coco@lists.linux.dev, Claudio Carvalho <cclaudio@linux.ibm.com>, 
	Dov Murik <dovmurik@linux.ibm.com>, linux-integrity@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 24, 2025 at 3:47=E2=80=AFAM Stefano Garzarella <sgarzare@redhat=
.com> wrote:
>
> From: Stefano Garzarella <sgarzare@redhat.com>
>
> Add two new functions to probe and send commands to the SVSM vTPM.
> They leverage the two calls defined by the AMD SVSM specification [1]
> for the vTPM protocol: SVSM_VTPM_QUERY and SVSM_VTPM_CMD.
>
> Expose these functions to be used by other modules such as a tpm
> driver.
>
> [1] "Secure VM Service Module for SEV-SNP Guests"
>     Publication # 58019 Revision: 1.00
>
> Co-developed-by: James Bottomley <James.Bottomley@HansenPartnership.com>
> Signed-off-by: James Bottomley <James.Bottomley@HansenPartnership.com>
> Co-developed-by: Claudio Carvalho <cclaudio@linux.ibm.com>
> Signed-off-by: Claudio Carvalho <cclaudio@linux.ibm.com>
> Reviewed-by: Tom Lendacky <thomas.lendacky@amd.com>
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> ---
> v4:
> - added Tom's R-b
> - added functions documentation [Jarkko]
> - simplified TPM_SEND_COMMAND check [Tom/Jarkko]
> v3:
> - removed link to the spec because those URLs are unstable [Borislav]
> - squashed "x86/sev: add SVSM call macros for the vTPM protocol" patch
>   in this one [Borislav]
> - slimmed down snp_svsm_vtpm_probe() [Borislav]
> - removed features check and any print related [Tom]
> ---
>  arch/x86/include/asm/sev.h |  7 +++++
>  arch/x86/coco/sev/core.c   | 59 ++++++++++++++++++++++++++++++++++++++
>  2 files changed, 66 insertions(+)
>
> diff --git a/arch/x86/include/asm/sev.h b/arch/x86/include/asm/sev.h
> index ba7999f66abe..09471d058ce5 100644
> --- a/arch/x86/include/asm/sev.h
> +++ b/arch/x86/include/asm/sev.h
> @@ -384,6 +384,10 @@ struct svsm_call {
>  #define SVSM_ATTEST_SERVICES           0
>  #define SVSM_ATTEST_SINGLE_SERVICE     1
>
> +#define SVSM_VTPM_CALL(x)              ((2ULL << 32) | (x))
> +#define SVSM_VTPM_QUERY                        0
> +#define SVSM_VTPM_CMD                  1
> +
>  #ifdef CONFIG_AMD_MEM_ENCRYPT
>
>  extern u8 snp_vmpl;
> @@ -481,6 +485,9 @@ void snp_msg_free(struct snp_msg_desc *mdesc);
>  int snp_send_guest_request(struct snp_msg_desc *mdesc, struct snp_guest_=
req *req,
>                            struct snp_guest_request_ioctl *rio);
>
> +bool snp_svsm_vtpm_probe(void);
> +int snp_svsm_vtpm_send_command(u8 *buffer);
> +

These should be defined static inline with trivial definitions in the
#else case, yes?

>  void __init snp_secure_tsc_prepare(void);
>  void __init snp_secure_tsc_init(void);
>
> diff --git a/arch/x86/coco/sev/core.c b/arch/x86/coco/sev/core.c
> index 96c7bc698e6b..034aab7e76d2 100644
> --- a/arch/x86/coco/sev/core.c
> +++ b/arch/x86/coco/sev/core.c
> @@ -2628,6 +2628,65 @@ static int snp_issue_guest_request(struct snp_gues=
t_req *req, struct snp_req_dat
>         return ret;
>  }
>
> +/**
> + * snp_svsm_vtpm_probe() - Probe if SVSM provides a vTPM device
> + *
> + * This function checks that there is SVSM and that it supports at least
> + * TPM_SEND_COMMAND which is the only request we use so far.
> + *
> + * Return: true if the platform provides a vTPM SVSM device, false other=
wise.
> + */
> +bool snp_svsm_vtpm_probe(void)
> +{
> +       struct svsm_call call =3D {};
> +
> +       /* The vTPM device is available only if a SVSM is present */
> +       if (!snp_vmpl)
> +               return false;
> +
> +       call.caa =3D svsm_get_caa();
> +       call.rax =3D SVSM_VTPM_CALL(SVSM_VTPM_QUERY);
> +
> +       if (svsm_perform_call_protocol(&call))
> +               return false;
> +
> +       /* Check platform commands contains TPM_SEND_COMMAND - platform c=
ommand 8 */
> +       return call.rcx_out & BIT_ULL(8);
> +}
> +EXPORT_SYMBOL_GPL(snp_svsm_vtpm_probe);
> +
> +/**
> + * snp_svsm_vtpm_send_command() - execute a vTPM operation on SVSM
> + * @buffer: A buffer used to both send the command and receive the respo=
nse.
> + *
> + * This function executes a SVSM_VTPM_CMD call as defined by
> + * "Secure VM Service Module for SEV-SNP Guests" Publication # 58019 Rev=
ision: 1.00
> + *
> + * All command request/response buffers have a common structure as speci=
fied by
> + * the following table:
> + *     Byte      Size       In/Out    Description
> + *     Offset    (Bytes)
> + *     0x000     4          In        Platform command
> + *                          Out       Platform command response size
> + *
> + * Each command can build upon this common request/response structure to=
 create
> + * a structure specific to the command.
> + * See include/linux/tpm_svsm.h for more details.
> + *
> + * Return: 0 on success, -errno on failure
> + */
> +int snp_svsm_vtpm_send_command(u8 *buffer)
> +{
> +       struct svsm_call call =3D {};
> +
> +       call.caa =3D svsm_get_caa();
> +       call.rax =3D SVSM_VTPM_CALL(SVSM_VTPM_CMD);
> +       call.rcx =3D __pa(buffer);
> +
> +       return svsm_perform_call_protocol(&call);
> +}
> +EXPORT_SYMBOL_GPL(snp_svsm_vtpm_send_command);
> +
>  static struct platform_device sev_guest_device =3D {
>         .name           =3D "sev-guest",
>         .id             =3D -1,
> --
> 2.49.0
>


--=20
-Dionna Glaze, PhD, CISSP, CCSP (she/her)
