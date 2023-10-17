Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008A3EBE
	for <linux-coco@lists.linux.dev>; Tue, 17 Oct 2023 16:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PSbbwHUF"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-5a7b9e83b70so44466467b3.0
        for <linux-coco@lists.linux.dev>; Tue, 17 Oct 2023 09:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697560034; x=1698164834; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/hJkp0YS8fbA60ZiTgrrQsXxvsEIWpcMYoRPyADSAvk=;
        b=PSbbwHUFBI4PqvZXlkOCMCvSnr1CFkvE4UlctB8SlWDFZr7vgWHCZmWiulzT7ygJaF
         c5yIY2HxX6BZ7gF/SeMGg1HvbNM8h6EYtzjCMhHYA4pFbPfU8nTNOk3DqO4iGER8eAn/
         xMTKAE12o+4RmvVeKFBCyOKVHl+UriJ0H2HX1L8dccOIl9noiGw9qL+4DtgzGQ+3QQCB
         BDONX82qlijStFOws/k6RwiitJk/xdhrndac7bKakoIUW9OxEYUYtYGVv/7x4UYLfuHl
         xtmRZQ5wEOHzIuam03pGU/aI9T59jn5L14T0E/fZBl5pFlLNZ5VmHGRRSZkujQ/GeZLx
         8AQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697560034; x=1698164834;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/hJkp0YS8fbA60ZiTgrrQsXxvsEIWpcMYoRPyADSAvk=;
        b=GMmZlyFbz9vN5qgbqxCfB26pznnc1AuZH32Jundq8YPfK1GrvEyuEXeMJ8qFo8cWp+
         NY2oj/McTVv3bXuHZq+WWjbvmFUtf/IAMIkTsbOyCy4WernYBlNIPu6wGRb5iPmRUGWG
         06UlXsiCcn3fNylGO5OfiIK94Nwi+/lxk8caSIjPgTrTvKldiSjg7YBVigdLO8JTo1UG
         qMUHQ2qPrOiN+WZAds1yaQIW80I2kK2LdMc3NFen1MJHLNH0mvRq+zu2IPlO8zr4+EMx
         zhomHANXBvys6VQLiE2i+foW2Oy948m2GsN1F3FeWYQNiWaGm5eH0bFkwWkWS6/uf0QW
         wQUQ==
X-Gm-Message-State: AOJu0Yxy5gmnbYq2GHfz+1rRBajgiRJOIgtDQpAqFkMOb7anrDTt3HfB
	9LUantXebVaINgPiLkMrM02nCALOn70=
X-Google-Smtp-Source: AGHT+IHTqfMaDOaUACBBNjywMbrRhxv3au8SZnqO5B/WdcHe7acDDk0Hy7ETXXqWEiO/SZnVQovTmDtZn3c=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:690c:88a:b0:5a7:b87d:9825 with SMTP id
 cd10-20020a05690c088a00b005a7b87d9825mr74938ywb.5.1697560034031; Tue, 17 Oct
 2023 09:27:14 -0700 (PDT)
Date: Tue, 17 Oct 2023 09:27:12 -0700
In-Reply-To: <CAAH4kHb=hNH88poYw-fj+ewYgt8F-hseZcRuLDdvbgpSQ5FDZQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20231016132819.1002933-1-michael.roth@amd.com>
 <20231016132819.1002933-49-michael.roth@amd.com> <CAAH4kHb=hNH88poYw-fj+ewYgt8F-hseZcRuLDdvbgpSQ5FDZQ@mail.gmail.com>
Message-ID: <ZS614OSoritrE1d2@google.com>
Subject: Re: [PATCH v10 48/50] KVM: SEV: Provide support for SNP_GUEST_REQUEST
 NAE event
From: Sean Christopherson <seanjc@google.com>
To: Dionna Amalie Glaze <dionnaglaze@google.com>
Cc: Michael Roth <michael.roth@amd.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-mm@kvack.org, linux-crypto@vger.kernel.org, x86@kernel.org, 
	linux-kernel@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com, 
	jroedel@suse.de, thomas.lendacky@amd.com, hpa@zytor.com, ardb@kernel.org, 
	pbonzini@redhat.com, vkuznets@redhat.com, jmattson@google.com, 
	luto@kernel.org, dave.hansen@linux.intel.com, slp@redhat.com, 
	pgonda@google.com, peterz@infradead.org, srinivas.pandruvada@linux.intel.com, 
	rientjes@google.com, dovmurik@linux.ibm.com, tobin@ibm.com, bp@alien8.de, 
	vbabka@suse.cz, kirill@shutemov.name, ak@linux.intel.com, tony.luck@intel.com, 
	marcorr@google.com, sathyanarayanan.kuppuswamy@linux.intel.com, 
	alpergun@google.com, jarkko@kernel.org, ashish.kalra@amd.com, 
	nikunj.dadhania@amd.com, pankaj.gupta@amd.com, liam.merwick@oracle.com, 
	zhi.a.wang@intel.com, Brijesh Singh <brijesh.singh@amd.com>, 
	Alexey Kardashevskiy <aik@amd.com>
Content-Type: text/plain; charset="us-ascii"

On Mon, Oct 16, 2023, Dionna Amalie Glaze wrote:
> > +
> > +       /*
> > +        * If a VMM-specific certificate blob hasn't been provided, grab the
> > +        * host-wide one.
> > +        */
> > +       snp_certs = sev_snp_certs_get(sev->snp_certs);
> > +       if (!snp_certs)
> > +               snp_certs = sev_snp_global_certs_get();
> > +
> 
> This is where the generation I suggested adding would get checked. If
> the instance certs' generation is not the global generation, then I
> think we need a way to return to the VMM to make that right before
> continuing to provide outdated certificates.
> This might be an unreasonable request, but the fact that the certs and
> reported_tcb can be set while a VM is running makes this an issue.

Before we get that far, the changelogs need to explain why the kernel is storing
userspace blobs in the first place.  The whole thing is a bit of a mess.

sev_snp_global_certs_get() has data races that could lead to variations of TOCTOU
bugs: sev_ioctl_snp_set_config() can overwrite psp_master->sev_data->snp_certs
while sev_snp_global_certs_get() is running.  If the compiler reloads snp_certs
between bumping the refcount and grabbing the pointer, KVM will end up leaking a
refcount and consuming a pointer without a refcount.

	if (!kref_get_unless_zero(&certs->kref))
		return NULL;

	return certs;

If allocating memory for the certs fails, the kernel will have set the config
but not store the corresponding certs.

	ret = __sev_do_cmd_locked(SEV_CMD_SNP_CONFIG, &config, &argp->error);
		if (ret)
			goto e_free;

		memcpy(&sev->snp_config, &config, sizeof(config));
	}

	/*
	 * If the new certs are passed then cache it else free the old certs.
	 */
	if (input.certs_len) {
		snp_certs = sev_snp_certs_new(certs, input.certs_len);
		if (!snp_certs) {
			ret = -ENOMEM;
			goto e_free;
		}
	}

Reasoning about ordering is also difficult, e.g. what is KVM's contract with
userspace in terms of recognizing new global certs?

I don't understand why the kernel needs to manage the certs.  AFAICT the so called
global certs aren't an input to SEV_CMD_SNP_CONFIG, i.e. SNP_SET_EXT_CONFIG is
purely a software defined thing.

The easiest solution I can think of is to have KVM provide a chunk of memory in
kvm_sev_info for SNP guests that userspace can mmap(), a la vcpu->run.

	struct sev_snp_certs {
		u8 data[KVM_MAX_SEV_SNP_CERT_SIZE];
		u32 size;
		u8 pad[<size to make the struct page aligned>];
	};

When the guest requests the certs, KVM does something like:

	certs_size = READ_ONCE(sev->snp_certs->size);
	if (certs_size > sizeof(sev->snp_certs->data) ||
	    !IS_ALIGNED(certs_size, PAGE_SIZE))
		certs_size = 0;

	if (certs_size && (data_npages << PAGE_SHIFT) < certs_size) {
		vcpu->arch.regs[VCPU_REGS_RBX] = certs_size >> PAGE_SHIFT;
		exitcode = SNP_GUEST_VMM_ERR(SNP_GUEST_VMM_ERR_INVALID_LEN);
		goto cleanup;
	}

	...

	if (certs_size &&
	    kvm_write_guest(kvm, data_gpa, sev->snp_certs->data, certs_size))
		exitcode = SEV_RET_INVALID_ADDRESS;

If userspace wants to provide garbage to the guest, so be it, not KVM's problem.
That way, whether the VM gets the global cert or a per-VM cert is purely a userspace
concern.

If userspace needs to *stall* cert requests, e.g. while the certs are being updated,
then that's a different issue entirely.  If the GHCB allows telling the guest to
retry the request, then it should be trivially easy to solve, e.g. add a flag in
sev_snp_certs.  If KVM must "immediately" handle the request, then we'll need more
elaborate uAPI.
