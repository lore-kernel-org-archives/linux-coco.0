Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1357B289809
	for <linux-coco@lists.linux.dev>; Wed, 14 May 2025 18:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747248641; cv=none; b=fvvpIY9UTCmaCoZu/op2oLbS7SdPFAcJ6IxHNmJRFfcAFS/pMKdexWYgVmLrxgSv/ECqFixnyB4SEng95zlrvjiRfiOPqbVQ/nGGukRQ3TTaG6B6R0cZXWttIpEzbhxd495NAnT5aWi6SMTUJJEC7J3QoBssgS9FepwtGgE9kxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747248641; c=relaxed/simple;
	bh=yQ3VbcxMjTfBgNEkrUs6mxV68vfYz2BfRMN7U8ZIyls=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fw2awLfIoPEX/6wpIXCYNYP6TMLOVrPxhdiy0RYm4ueVSElHVS4J0woJr8ITLXmq3llpmul2wKTJdDXXQyUNcTmc46fPy1F61+HSn1m8nHMmMCtaWAveVkhHI0LFLj31OCcAB2cXZ/ZR9PnYinBkI3gb8/ZjvD0nZVhNbrza9DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0UFx2vUS; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0UFx2vUS"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-23035b3edf1so1434095ad.3
        for <linux-coco@lists.linux.dev>; Wed, 14 May 2025 11:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747248639; x=1747853439; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E3r7cBzCFmuno6UrTL/44SBZTRLVowFGshGs/OOoXys=;
        b=0UFx2vUSUyTckF/2KA+00wMy1FdLAFWKUBOUDMEptyIPzSP+1shB8Hc1xQXK3Wj1Sa
         K4BXBEYVc3jkg7BcRbwER0yl/GU4hxzb5yksW5Tyn5camkgDsmRt5A6nvCTt6yBX6iS/
         2z7xNC1PYrr6+r3qmg0JWTZLdN5hDW3AVJzG+rbdcFnzcTSixDXRZUEDOFLPhdCeTaez
         +iMmsW1EyoYIceSIxZvkOxlDVzdjtciSoC40W+a9b58+sjvDpO/aYKpz09IZJ5cLeAzC
         TBPyLZ1JKZKpmiqdsGLgHOPkwre6826OrXNL2zQZVnUjy2SWJZJyC1BQttSLP9mNoV/N
         ++7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747248639; x=1747853439;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E3r7cBzCFmuno6UrTL/44SBZTRLVowFGshGs/OOoXys=;
        b=sW5/9v/EC0qcSQqKPgWzF9q1GlF3bsODSjbL0qipLv6LBhujywfF1X1YtFKMgUg536
         ahWWU1icsAPgoG/7XL1twJHFDruJYtbNOYmurRyp3IYWwrhnbaOr4lIe4D43FOTfc6uK
         gdoGePiriQgxQ42tmCcPj72fIvGj3H+yu6PRIkJeS8KCSoqv/ooR5penGKqNy73H858Q
         yU9peGlyI0+6jzJyx23COgWXyWQNO5VOmibmSeZkDqsshH4MGVBl5TJW0dRLVwSaobq2
         WkHwpROT6mCHwttKNQRx8+Q0GBmSfO1cBz2OZb8BueI2JODPzksmKCkqz/2DjRr3me/p
         loSw==
X-Forwarded-Encrypted: i=1; AJvYcCWLXR/nOOIO25DsA2Aaq1PGhVO1UiaGAGSd8MNha40eojfjiMVzljIlWAgaOcLYdPSCpzoyvc6xaqD/@lists.linux.dev
X-Gm-Message-State: AOJu0YwrtzHHEDoDl3LL33Xyo1ZqHFfnVjZAITqi3YtJffJZhQaI7g0t
	IIwJJER3vIpbYsQSrZIa4jA+tQLnK0a2XewFUnR1Oq8kSkNdav/5LfyBLXm/51FgjjIVBZmdqz0
	Ptai7wfAmfvWcFoARGKdVsGiQQT4S1nZAmxzW
X-Gm-Gg: ASbGncsvHd5TkbRKVk29V+lMoJNOBtbeqXezVDwDIG4eIksXfjvW2LtjV0JUcRL3McI
	JamBd26nS7mR7gepryKC6AMDEDRTIH2hLz5VlRq0+Z8gRix+F+K5sRkCOPRuKIMeu/Q6umijSU4
	RcImb2DYcRCIKZACGM4uSYhz7z6Gb1xbZu173t1EczJZfhx1n4YCq4XUhyP9bLpYc=
X-Google-Smtp-Source: AGHT+IFvz3QZQY+K22TrInrG08w8YC5t6mgG7doJwcS6fxYutxT3hnWiETKjQumhxhtWJMFZfIPRKQk1ZfXIk93Qbyg=
X-Received: by 2002:a17:903:3baf:b0:22e:72fe:5f9c with SMTP id
 d9443c01a7336-231981c393dmr59419885ad.42.1747248638978; Wed, 14 May 2025
 11:50:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250514184136.238446-1-dionnaglaze@google.com> <20250514184136.238446-2-dionnaglaze@google.com>
In-Reply-To: <20250514184136.238446-2-dionnaglaze@google.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Wed, 14 May 2025 11:50:25 -0700
X-Gm-Features: AX0GCFsb8GutGsBFhVunAsZ_JHd09dz15va6MT-yCEew-LE4iyIMGHd88HH0L_o
Message-ID: <CAAH4kHY_NyTD_uwA=EJ5U2RO7cCYJpdeBQ_enCj2ZjXVXAdLhA@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] kvm: sev: Add SEV-SNP guest request throttling
To: kvm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	Thomas Lendacky <Thomas.Lendacky@amd.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Joerg Roedel <jroedel@suse.de>, Peter Gonda <pgonda@google.com>, Borislav Petkov <bp@alien8.de>, 
	Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 14, 2025 at 11:41=E2=80=AFAM Dionna Glaze <dionnaglaze@google.c=
om> wrote:
>
> The AMD-SP is a precious resource that doesn't have a scheduler other
> than a mutex lock queue. To avoid customers from causing a DoS, a
> mem_enc_ioctl command for rate limiting guest requests is added.
>
> Recommended values are {.interval_ms =3D 1000, .burst =3D 1} or
> {.interval_ms =3D 2000, .burst =3D 2} to average 1 request every second.
> You may need to allow 2 requests back to back to allow for the guest
> to query the certificate length in an extended guest request without
> a pause. The 1 second average is our target for quality of service
> since empirical tests show that 64 VMs can concurrently request an
> attestation report with a maximum latency of 1 second. We don't
> anticipate more concurrency than that for a seldom used request for
> a majority well-behaved set of VMs. The majority point is decided as
> >64 VMs given the assumed 128 VM count for "extreme load".
>
> Cc: Thomas Lendacky <Thomas.Lendacky@amd.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Joerg Roedel <jroedel@suse.de>
> Cc: Peter Gonda <pgonda@google.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Sean Christopherson <seanjc@google.com>
>
> Signed-off-by: Dionna Glaze <dionnaglaze@google.com>
> ---
>  .../virt/kvm/x86/amd-memory-encryption.rst    | 23 ++++++++++++++
>  arch/x86/include/uapi/asm/kvm.h               |  7 +++++
>  arch/x86/kvm/svm/sev.c                        | 31 +++++++++++++++++++
>  arch/x86/kvm/svm/svm.h                        |  2 ++
>  4 files changed, 63 insertions(+)
>
> diff --git a/Documentation/virt/kvm/x86/amd-memory-encryption.rst b/Docum=
entation/virt/kvm/x86/amd-memory-encryption.rst
> index 1ddb6a86ce7f..1b5b4fc35aac 100644
> --- a/Documentation/virt/kvm/x86/amd-memory-encryption.rst
> +++ b/Documentation/virt/kvm/x86/amd-memory-encryption.rst
> @@ -572,6 +572,29 @@ Returns: 0 on success, -negative on error
>  See SNP_LAUNCH_FINISH in the SEV-SNP specification [snp-fw-abi]_ for fur=
ther
>  details on the input parameters in ``struct kvm_sev_snp_launch_finish``.
>
> +21. KVM_SEV_SNP_SET_REQUEST_THROTTLE_RATE
> +-----------------------------------------
> +
> +The KVM_SEV_SNP_SET_REQUEST_THROTTLE_RATE command is used to set a per-V=
M rate
> +limit on responding to requests for AMD-SP to process a guest request.
> +The AMD-SP is a global resource with limited capacity, so to avoid noisy
> +neighbor effects, the host may set a request rate for guests.
> +
> +Parameters (in): struct kvm_sev_snp_set_request_throttle_rate
> +
> +Returns: 0 on success, -negative on error
> +
> +::
> +
> +       struct kvm_sev_snp_set_request_throttle_rate {
> +               __u32 interval_ms;
> +               __u32 burst;
> +       };
> +
> +The interval will be translated into jiffies, so if it after transformat=
ion
> +the interval is 0, the command will return ``-EINVAL``. The ``burst`` va=
lue
> +must be greater than 0.
> +
>  Device attribute API
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> diff --git a/arch/x86/include/uapi/asm/kvm.h b/arch/x86/include/uapi/asm/=
kvm.h
> index 460306b35a4b..d92242d9b9af 100644
> --- a/arch/x86/include/uapi/asm/kvm.h
> +++ b/arch/x86/include/uapi/asm/kvm.h
> @@ -708,6 +708,8 @@ enum sev_cmd_id {
>         KVM_SEV_SNP_LAUNCH_UPDATE,
>         KVM_SEV_SNP_LAUNCH_FINISH,
>
> +       KVM_SEV_SNP_SET_REQUEST_THROTTLE_RATE,
> +
>         KVM_SEV_NR_MAX,
>  };
>
> @@ -877,6 +879,11 @@ struct kvm_sev_snp_launch_finish {
>         __u64 pad1[4];
>  };
>
> +struct kvm_sev_snp_set_request_throttle_rate {
> +       __u32 interval_ms;
> +       __u32 burst;
> +};
> +
>  #define KVM_X2APIC_API_USE_32BIT_IDS            (1ULL << 0)
>  #define KVM_X2APIC_API_DISABLE_BROADCAST_QUIRK  (1ULL << 1)
>
> diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
> index a7a7dc507336..febf4b45fddf 100644
> --- a/arch/x86/kvm/svm/sev.c
> +++ b/arch/x86/kvm/svm/sev.c
> @@ -2535,6 +2535,29 @@ static int snp_launch_finish(struct kvm *kvm, stru=
ct kvm_sev_cmd *argp)
>         return ret;
>  }
>
> +static int snp_set_request_throttle_ms(struct kvm *kvm, struct kvm_sev_c=
md *argp)
> +{
> +       struct kvm_sev_info *sev =3D to_kvm_sev_info(kvm);
> +       struct kvm_sev_snp_set_request_throttle_rate params;
> +       int ret;
> +       u64 jiffies;
> +
> +       if (!sev_snp_guest(kvm))
> +               return -ENOTTY;
> +
> +       if (copy_from_user(&params, u64_to_user_ptr(argp->data), sizeof(p=
arams)))
> +               return -EFAULT;
> +
> +       jiffies =3D (params.interval_ms * HZ) / 1000;
> +
> +       if (!jiffies || !params.burst)
> +               return -EINVAL;
> +
> +       ratelimit_state_init(&sev->snp_guest_msg_rs, jiffies, params.burs=
t);
> +
> +       return 0;
> +}
> +
>  int sev_mem_enc_ioctl(struct kvm *kvm, void __user *argp)
>  {
>         struct kvm_sev_cmd sev_cmd;
> @@ -2640,6 +2663,9 @@ int sev_mem_enc_ioctl(struct kvm *kvm, void __user =
*argp)
>         case KVM_SEV_SNP_LAUNCH_FINISH:
>                 r =3D snp_launch_finish(kvm, &sev_cmd);
>                 break;
> +       case KVM_SEV_SNP_SET_REQUEST_THROTTLE_RATE_MS:
> +               r =3D snp_set_request_throttle_ms(kvm, &sev_cmd);
> +               break;
>         default:
>                 r =3D -EINVAL;
>                 goto out;
> @@ -4015,6 +4041,11 @@ static int snp_handle_guest_req(struct vcpu_svm *s=
vm, gpa_t req_gpa, gpa_t resp_
>
>         mutex_lock(&sev->guest_req_mutex);
>
> +       if (!__ratelimit(&sev->snp_guest_msg_rs)) {
> +               rc =3D SNP_GUEST_VMM_ERR_BUSY;

embarrassing. My build totally skipped this error. Disregard as well.

> +               goto out_unlock;
> +       }
> +
>         if (kvm_read_guest(kvm, req_gpa, sev->guest_req_buf, PAGE_SIZE)) =
{
>                 ret =3D -EIO;
>                 goto out_unlock;
> diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
> index f16b068c4228..0a7c8d3a7560 100644
> --- a/arch/x86/kvm/svm/svm.h
> +++ b/arch/x86/kvm/svm/svm.h
> @@ -112,6 +112,8 @@ struct kvm_sev_info {
>         void *guest_req_buf;    /* Bounce buffer for SNP Guest Request in=
put */
>         void *guest_resp_buf;   /* Bounce buffer for SNP Guest Request ou=
tput */
>         struct mutex guest_req_mutex; /* Must acquire before using bounce=
 buffers */
> +
> +       struct ratelimit_state snp_guest_msg_rs; /* Limit guest requests =
*/
>  };
>
>  struct kvm_svm {
> --
> 2.49.0.1045.g170613ef41-goog
>


--=20
-Dionna Glaze, PhD, CISSP, CCSP (she/her)
