Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5475E9CA68
	for <linux-coco@lists.linux.dev>; Wed, 18 Oct 2023 20:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YNst2CaK"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-5a7aa816c5bso117473047b3.1
        for <linux-coco@lists.linux.dev>; Wed, 18 Oct 2023 13:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697661527; x=1698266327; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=B2vuxwNUjHanOakE7PhkoyaYiDRMZoiUmEZlALcX3Sg=;
        b=YNst2CaKXVFmhe7dKa20GzULi1R3mkItGeT+/1ppCMLJsYfNC3KEJdX5CWwwDimgxx
         wdnIiGLPQm+O5tRXuC5TjQEXKCuBXC93XTA0PB6Qr+iQrQCkHHBQtAQ34t8iboo9HoJV
         zruz/oPW8s4mJboY0guVnDbgT5Nsv2/Sfv9jc55mrsVfPzxWEEfpOqKNMLoib0GgchQO
         faqMP9qUjE9vDdwCc3GZL5nFLCTAIyvT5gbKajmvP49k/aLpxl9LEYZoN8ttAFGtdyjQ
         7VLYduu6v3Ug9mVq8+RxdQkdB30JF0qdxkQ3UVHgwJIZCPHmSs006fNjfshdUJvVShgL
         wdrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697661527; x=1698266327;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B2vuxwNUjHanOakE7PhkoyaYiDRMZoiUmEZlALcX3Sg=;
        b=wnOnCqdyvNYjIDsjl8pOcDOLAwXxzKb1VA+SMwaEQR9j0n6xMZ7Gh2a0YlaDPZgUBY
         Eu3L5PQCQwLp2LOFVI+fvTBGuCWeIgDEcMTS4SDK5q+XXrBAgaPJFGHH1cwVWxaftP26
         Zo0f4LNT/WuBtXirNnwRt4xy4YsnsaaS60vKaJrBpYD9S6uA46TmAT8tjWzdeky8q/Ph
         gyk0b1HW1zqcmDok4XAfBvx9G8ntcmUm0FGNM2kKL5Qo9oa5Q6habQ3eOfh12JvQU0Yx
         dOUzwdrUyGNWYnl2+9FjLF9XiZiqX3Rw7jSDUnnmuP2Aq23xoM+5H8vxD0BopWSkKboc
         ts2Q==
X-Gm-Message-State: AOJu0YxcWMOBigsPrEgLXaNP/dcNnYorVOcx2rd7m7Nnru8eGsKU80me
	qArMzzDKIvz+28Sl4gxdPCMJyprexcw=
X-Google-Smtp-Source: AGHT+IGd6l8t7dSPqvjLwr1up5LbNppFyLB+KHswpcTN3MkRXf+fX3swfqUVEKJu/4yV2rYkq43dRov4EMo=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a0d:d5ca:0:b0:5a8:7b96:23d8 with SMTP id
 x193-20020a0dd5ca000000b005a87b9623d8mr9852ywd.3.1697661527331; Wed, 18 Oct
 2023 13:38:47 -0700 (PDT)
Date: Wed, 18 Oct 2023 13:38:46 -0700
In-Reply-To: <09556ee3-3d9c-0ecc-0b4a-3df2d6bb5255@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20231016132819.1002933-1-michael.roth@amd.com>
 <20231016132819.1002933-49-michael.roth@amd.com> <CAAH4kHb=hNH88poYw-fj+ewYgt8F-hseZcRuLDdvbgpSQ5FDZQ@mail.gmail.com>
 <ZS614OSoritrE1d2@google.com> <b9da2fed-b527-4242-a588-7fc3ee6c9070@amd.com>
 <ZS_iS4UOgBbssp7Z@google.com> <09556ee3-3d9c-0ecc-0b4a-3df2d6bb5255@amd.com>
Message-ID: <ZTBCVpXaGcyFaozo@google.com>
Subject: Re: [PATCH v10 48/50] KVM: SEV: Provide support for SNP_GUEST_REQUEST
 NAE event
From: Sean Christopherson <seanjc@google.com>
To: Ashish Kalra <ashish.kalra@amd.com>
Cc: Alexey Kardashevskiy <aik@amd.com>, Dionna Amalie Glaze <dionnaglaze@google.com>, 
	Michael Roth <michael.roth@amd.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-mm@kvack.org, linux-crypto@vger.kernel.org, x86@kernel.org, 
	linux-kernel@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com, 
	jroedel@suse.de, thomas.lendacky@amd.com, hpa@zytor.com, ardb@kernel.org, 
	pbonzini@redhat.com, vkuznets@redhat.com, jmattson@google.com, 
	luto@kernel.org, dave.hansen@linux.intel.com, slp@redhat.com, 
	pgonda@google.com, peterz@infradead.org, srinivas.pandruvada@linux.intel.com, 
	rientjes@google.com, dovmurik@linux.ibm.com, tobin@ibm.com, bp@alien8.de, 
	vbabka@suse.cz, kirill@shutemov.name, ak@linux.intel.com, tony.luck@intel.com, 
	marcorr@google.com, sathyanarayanan.kuppuswamy@linux.intel.com, 
	alpergun@google.com, jarkko@kernel.org, nikunj.dadhania@amd.com, 
	pankaj.gupta@amd.com, liam.merwick@oracle.com, zhi.a.wang@intel.com, 
	Brijesh Singh <brijesh.singh@amd.com>
Content-Type: text/plain; charset="us-ascii"

On Wed, Oct 18, 2023, Ashish Kalra wrote:
> > static int snp_handle_ext_guest_request(struct vcpu_svm *svm)
> > {
> > 	struct kvm_vcpu *vcpu = &svm->vcpu;
> > 	struct kvm *kvm = vcpu->kvm;
> > 	struct kvm_sev_info *sev;
> > 	unsigned long exitcode;
> > 	u64 data_gpa;
> > 
> > 	if (!sev_snp_guest(vcpu->kvm)) {
> > 		ghcb_set_sw_exit_info_2(svm->sev_es.ghcb, SEV_RET_INVALID_GUEST);
> > 		return 1;
> > 	}
> > 
> > 	data_gpa = vcpu->arch.regs[VCPU_REGS_RAX];
> > 	if (!IS_ALIGNED(data_gpa, PAGE_SIZE)) {
> > 		ghcb_set_sw_exit_info_2(svm->sev_es.ghcb, SEV_RET_INVALID_ADDRESS);
> > 		return 1;
> > 	}
> > 
> > 	vcpu->run->hypercall.nr		 = KVM_HC_SNP_GET_CERTS;
> > 	vcpu->run->hypercall.args[0]	 = data_gpa;
> > 	vcpu->run->hypercall.args[1]	 = vcpu->arch.regs[VCPU_REGS_RBX];
> > 	vcpu->run->hypercall.flags	 = KVM_EXIT_HYPERCALL_LONG_MODE;
> > 	vcpu->arch.complete_userspace_io = snp_complete_ext_guest_request;
> > 	return 0;
> > }
> > 
> 
> IIRC, the important consideration here is to ensure that getting the
> attestation report and retrieving the certificates appears atomic to the
> guest. When SNP live migration is supported we don't want a case where the
> guest could have migrated between the call to obtain the certificates and
> obtaining the attestation report, which can potentially cause failure of
> validation of the attestation report.

Where does "obtaining the attestation report" happen?  I see the guest request
and the certificate stuff, I don't see anything about attestation reports (though
I'm not looking very closely).
