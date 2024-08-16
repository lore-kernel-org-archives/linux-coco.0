Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813767DA64
	for <linux-coco@lists.linux.dev>; Fri, 16 Aug 2024 21:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723845078; cv=none; b=Jtkj+IpVxo0/IL8ZXspEmJceyjvYwBoQ8qPLdojU7HRTloOYRKjBxtFKF7CiOgESY8fA21I6EmKOUYhub7MvZj28ftyTzkjCH7+ZpZLSV1QHzhHV2JCPaGxmrUM3VbjrlsNpxThHttOj0VbEJhgbQ1xvJdu3hTgCE/EiuXIAxWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723845078; c=relaxed/simple;
	bh=KBd6sqjPUrDj4KtyJBS+inkODx/JwJeDXwPuU1WiGQU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iweM8HAijKFapfIB7IVbZ7WSIOGOQACNf2XMV8Bgcn4si/mZAcvWvrI71nB+hkmyS/G0CMEpkIwwvzZYJsDQM9/0gzb3XD9TwKOX4NbMtvpuTJmsyCsEfsato1Nwi+Gt2pzcj0aAohWOLxythpCPy2I9HKmzvhID1BLPPsEIPCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sbAXTkDA; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sbAXTkDA"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a7aa4bf4d1eso339762166b.0
        for <linux-coco@lists.linux.dev>; Fri, 16 Aug 2024 14:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723845074; x=1724449874; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tSoLT3jQSFrMPTRX3f3E09PU/Z1+sySUyTnEKJFhXh4=;
        b=sbAXTkDAKD/91/LvLREJna1eUaI2OP4CSWguh+Syoyia5gY47oiJmdnuhfKHx9GEFP
         VnHcfsMWtSar7wBq9MYSIeAaBJOfX+/tNc1aBR/B4+0K75asj2o8Oj/8Bx2v/3mMCCXK
         mJxfJHoVOIEz+JQuq91dq8j3c6PuiE7VoVTk2Yfo8XEhLrzwmBqN8kA9f2ZoC7bl5a/v
         0ehiTfD4fdNKO89MjaLd3vHjzSX/vnYKJKTRaqYapx6yQ32wKcxb/5s0E74FC9t96Ko6
         fGnkGLiwuVS6KEvtvrvnYFW15kiqpYwamUQHBtokknM+rd+JmF1Z5fnOux2ecP0mMiEA
         0cOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723845074; x=1724449874;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tSoLT3jQSFrMPTRX3f3E09PU/Z1+sySUyTnEKJFhXh4=;
        b=geu1O8NVLgMDb72selbxIrM61DLo7kBmlH0WAXhLDp2X4zTHIfZIjcnATwOEB8d6Vz
         Q8axfVxUHlZhwvpdRhELlRuIGVdLGVSSHZ/zZkFFN9IjJthAZdyEFHQLHKt8V3kme/sT
         HKGzWIkPgvfM8nPs8urUzbmP9MFLlt/EUOVdd4ITbMlHrq+3aBVBdQ/cVcKqhElqKzzU
         7MW97VeFKhQqwm1bclPJFdxHuqWg2ns2Hu9GGr54JmUtFrt7FU+JiLgqs2SwqHoMvkch
         b//NARaiPfsz094V0mRFhncIWEH75TTypc113a7tVmgfHoYiMyMfY/iGr5dPWC5dszsW
         v1og==
X-Forwarded-Encrypted: i=1; AJvYcCVvfgvqQAJ5yIpzoNgQxM/xMRJLT2qReNzFsGxD6wJXmxatLN4fag8/Hb0ZA33uczhLvFAyjKLNjQNv5WVKa7bEaqBTlpK15xiNgA==
X-Gm-Message-State: AOJu0YzeLnDYESCy4PA3ajU/7+j7hVqdkysRuh4OHz60if7yq2aB25Pr
	E+wGi03FBsyUEFOeVRJNcuIlX/GJYULf/BqKFrTaoTYdMhvBda1z8t/m2kKAPgnUMgci3zMMWu5
	gobL0KPB6axbwHTnpvBzYmjJq3NcZSEfAWfdF
X-Google-Smtp-Source: AGHT+IEmc4kaoUmyndexzsa7RrjVkpBN/O6EN0guPJoo2EGRzlWVfpPIGDGKEfKmK4pOF9srqCEqaC5Eq+aT59GDm8Y=
X-Received: by 2002:a17:907:e2c3:b0:a7a:b1a8:6a2e with SMTP id
 a640c23a62f3a-a839292ff2bmr297152766b.28.1723845073435; Fri, 16 Aug 2024
 14:51:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZkN25BPuLtTUmDKk@google.com> <20240515012552.801134-1-michael.roth@amd.com>
In-Reply-To: <20240515012552.801134-1-michael.roth@amd.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Fri, 16 Aug 2024 14:50:59 -0700
Message-ID: <CAAH4kHb03Una2kcvyC3W=1ZfANBWF_7a7zsSmWhr_r9g3rCDZw@mail.gmail.com>
Subject: Re: [PATCH] KVM: SEV: Replace KVM_EXIT_VMGEXIT with KVM_EXIT_SNP_REQ_CERTS
To: Michael Roth <michael.roth@amd.com>
Cc: seanjc@google.com, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-mm@kvack.org, linux-crypto@vger.kernel.org, x86@kernel.org, 
	linux-kernel@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com, 
	jroedel@suse.de, thomas.lendacky@amd.com, hpa@zytor.com, ardb@kernel.org, 
	pbonzini@redhat.com, vkuznets@redhat.com, jmattson@google.com, 
	luto@kernel.org, dave.hansen@linux.intel.com, slp@redhat.com, 
	pgonda@google.com, peterz@infradead.org, srinivas.pandruvada@linux.intel.com, 
	rientjes@google.com, dovmurik@linux.ibm.com, tobin@ibm.com, bp@alien8.de, 
	vbabka@suse.cz, kirill@shutemov.name, ak@linux.intel.com, tony.luck@intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, alpergun@google.com, 
	jarkko@kernel.org, ashish.kalra@amd.com, nikunj.dadhania@amd.com, 
	pankaj.gupta@amd.com, liam.merwick@oracle.com, papaluri@amd.com
Content-Type: text/plain; charset="UTF-8"

> --- a/arch/x86/kvm/svm/sev.c
> +++ b/arch/x86/kvm/svm/sev.c
> @@ -4006,21 +4006,14 @@ static int snp_complete_ext_guest_req(struct kvm_vcpu *vcpu)
>         sev_ret_code fw_err = 0;
>         int vmm_ret;
>
> -       vmm_ret = vcpu->run->vmgexit.req_certs.ret;
> +       vmm_ret = vcpu->run->snp_req_certs.ret;
>         if (vmm_ret) {
>                 if (vmm_ret == SNP_GUEST_VMM_ERR_INVALID_LEN)
>                         vcpu->arch.regs[VCPU_REGS_RBX] =
> -                               vcpu->run->vmgexit.req_certs.data_npages;
> +                               vcpu->run->snp_req_certs.data_npages;
>                 goto out;
>         }

Finally getting around to this patch. Thanks for your patience.

Whether the exit to guest for certs is first or second when getting
the attestation report, the certificates need to be
consistent. Since we don't have any locks held before exiting, and no
checks happening on the result, there's a
chance that a well-intentioned host can still provide the wrong
certificate to the guest when VMs are running and requesting
attestations during a firmware hotload.

Thread 1:
DOWNLOAD_FIRMWARE_EX please
CURRENT_TCB > REPORTED_TCB
(notify service to get a new VCEK cert)
Interrupted

Thread 2:
VM extended guest request in.
Exit to user space
Call SNP_PLATFORM_STATUS to get REPORTED_TCB.
Get certs for REPORTED_TCB for the blob. It's at /x/y/z-REPORTED_TCB.crt.
Interrupted

Thread 1:
I got my VCEK cert delivered for CURRENT_TCB! I'll put it at
/x/y/z-CURRENT_TCB.crt
Great. SNP_COMMIT.
Now both REPORTED_TCB and COMMITTED_TCB to CURRENT_TCB, because that's
the spec. Different reported_tcb here. than in thread 1.
Interrupted

Thread 2:
Get the attestation report. It will be signed by the VCEK versioned to
the newer REPORTED_TCB.
Return to VM guest

VM guest:
My report's signature doesn't verify with the VCEK cert I was given.
Yes, 1-88-COM-PLAIN?

How do we avoid this?
1. We can advise that the guest parses the certificate and the
attestation report to determine if their TCBs match expectations and
retry if they're different because of a bad luck data race.
2. We can add a new global lock that KVM holds from CCP similar to
sev_cmd_lock to sequentialize req_certs, attestation reports, and
SNP_COMMIT. KVM releases the lock before returning to the guest.
  SNP_COMMIT must now hold this lock before attempting to grab the sev_cmd_lock.

I think probably 2 is better.

>
> @@ -4060,12 +4045,9 @@ static int snp_begin_ext_guest_req(struct kvm_vcpu *vcpu)
>          * Grab the certificates from userspace so that can be bundled with
>          * attestation/guest requests.
>          */
> -       vcpu->run->exit_reason = KVM_EXIT_VMGEXIT;
> -       vcpu->run->vmgexit.type = KVM_USER_VMGEXIT_REQ_CERTS;
> -       vcpu->run->vmgexit.req_certs.data_gpa = data_gpa;
> -       vcpu->run->vmgexit.req_certs.data_npages = data_npages;
> -       vcpu->run->vmgexit.req_certs.flags = 0;
> -       vcpu->run->vmgexit.req_certs.status = KVM_USER_VMGEXIT_REQ_CERTS_STATUS_PENDING;
> +       vcpu->run->exit_reason = KVM_EXIT_SNP_REQ_CERTS;

This should be whatever exit reason #define you go with (40), not the
(1) you defined for kvm_snp_exit.

> +       vcpu->run->snp_req_certs.data_gpa = data_gpa;
> +       vcpu->run->snp_req_certs.data_npages = data_npages;
>         vcpu->arch.complete_userspace_io = snp_complete_ext_guest_req;
>
>         return 0; /* forward request to userspace */
> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> index 106367d87189..8ebfc91dc967 100644
> --- a/include/uapi/linux/kvm.h
> +++ b/include/uapi/linux/kvm.h
> @@ -135,22 +135,17 @@ struct kvm_xen_exit {
>         } u;
>  };
>
> -struct kvm_user_vmgexit {
> -#define KVM_USER_VMGEXIT_REQ_CERTS             1
> -       __u32 type; /* KVM_USER_VMGEXIT_* type */
> +struct kvm_exit_snp {
> +#define KVM_EXIT_SNP_REQ_CERTS         1
> +       __u32 type; /* KVM_EXIT_SNP_* type */

I think this whole struct should be removed since we're only doing the
one exit reason. This is unused.
You also double-#define the return value preprocessor directives.

>  };
> @@ -198,7 +193,7 @@ struct kvm_user_vmgexit {
>  #define KVM_EXIT_NOTIFY           37
>  #define KVM_EXIT_LOONGARCH_IOCSR  38
>  #define KVM_EXIT_MEMORY_FAULT     39
> -#define KVM_EXIT_VMGEXIT          40
> +#define KVM_EXIT_SNP_REQUEST_CERTS 40

Probably we should just make this KVM_EXT_SNP_REQ_CERTS so the rest of
the code works.
>
>  /* For KVM_EXIT_INTERNAL_ERROR */
>  /* Emulate instruction failed. */
> @@ -454,8 +449,16 @@ struct kvm_run {
>                         __u64 gpa;
>                         __u64 size;
>                 } memory_fault;
> -               /* KVM_EXIT_VMGEXIT */
> -               struct kvm_user_vmgexit vmgexit;
> +               /* KVM_EXIT_SNP_REQ_CERTS */
> +               struct {
> +                       __u64 data_gpa;
> +                       __u64 data_npages;
> +#define KVM_EXIT_SNP_REQ_CERTS_ERROR_INVALID_LEN   1
> +#define KVM_EXIT_SNP_REQ_CERTS_ERROR_BUSY          2
> +#define KVM_EXIT_SNP_REQ_CERTS_ERROR_GENERIC       (1 << 31)
> +                       __u32 ret;
> +               } snp_req_certs;
> +
>                 /* Fix the size of the union. */
>                 char padding[256];
>         };
> --
> 2.25.1
>
>


--
-Dionna Glaze, PhD, CISSP, CCSP (she/her)
