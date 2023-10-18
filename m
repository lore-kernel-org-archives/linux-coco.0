Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6170C28DD9
	for <linux-coco@lists.linux.dev>; Wed, 18 Oct 2023 21:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HOfOUD7F"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-6bcefd3b248so3844663b3a.3
        for <linux-coco@lists.linux.dev>; Wed, 18 Oct 2023 14:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697665415; x=1698270215; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yHOjPmOC7r0r+5ar9NobWThJ75pkt4P9q/gadRDvKdc=;
        b=HOfOUD7FBsF90WlzIVrq3amk0Keiumi0bqgCLcAt94E8bRfW66OZOgMPNHUpHLd/BA
         I7j3lfHOGa430lMvRuvO7y3KdkZMDGczvdDfC5GWyG2k/TBZyRAqgl5rXmbxW5MjLRag
         8M5F/SzR00TeU/qlKiOFIE29BZzWp/JdYeTB+8rtCBnt1Y5JXuSuV9BAIFI6aLCSmiy5
         ZDCWgqoSvz09Y9hq6FS1kbyKNVnOmA8gQHBE6b7xWN2Mz7y/kSx0xeXX24hoiZTPiuu0
         ljotIkMq6JLJn6BX8pxxWZRejeQPQOSXxXCtgXRlQZMCQiKfwalzY3cm6ifJPfgEYUB9
         hdiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697665415; x=1698270215;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yHOjPmOC7r0r+5ar9NobWThJ75pkt4P9q/gadRDvKdc=;
        b=Z0ZFEHTSWTdkpkiJOVZHi0G8OCCdx+5O08UExUQ59H+k/Wnci8tMy7RWi52gecRMsK
         lFlijxTO/mcwbo+NzxGIJEiCnfTcc6ZjRkVzwlTFGeLB+dRL39Nu49uso6x+tSMZd2eq
         HyiVy1IG4WIQ31eFaLsRx25qXdiUunmWKmrvRX8A17SLFR7GqISnn1sz/pxGXcWY7k48
         55Rq5Q9++8xDrOdcCv1yP7PfszuXH5ZWU0fYBPwlIinschHAAbKz0mWim/lTIXmjWrx4
         lDVNBJxnLaGplhXjLV7J500h28Qvewz8xVYiPnjk8wTytoUMubLk+X6F9WkWWan34DQ8
         i+nQ==
X-Gm-Message-State: AOJu0YxZ5Ub/05aVO3mKFMnPajC4MnQ+mUJCGi+Bwcqh/zaWRtpiQIXR
	zxWtVaOpXQ2UtNjJZODKky91a/snRfY=
X-Google-Smtp-Source: AGHT+IGUIkCQe1UK/QW99mdDBgVsiaYRLV507eIWp4Sq8wCBVUL0fhdbBBlk6yGAr+Sqlx1A3Hmy2I+nx8s=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:aa7:8f96:0:b0:68f:cb69:8e76 with SMTP id
 t22-20020aa78f96000000b0068fcb698e76mr7929pfs.2.1697665415538; Wed, 18 Oct
 2023 14:43:35 -0700 (PDT)
Date: Wed, 18 Oct 2023 14:43:33 -0700
In-Reply-To: <4f8bb755-e208-fd8c-f948-f7d64260f8a7@amd.com>
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
 <ZTBCVpXaGcyFaozo@google.com> <4f8bb755-e208-fd8c-f948-f7d64260f8a7@amd.com>
Message-ID: <ZTBRhbCwgZVcKwkP@google.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 18, 2023, Ashish Kalra wrote:
>=20
> On 10/18/2023 3:38 PM, Sean Christopherson wrote:
> > On Wed, Oct 18, 2023, Ashish Kalra wrote:
> > > > static int snp_handle_ext_guest_request(struct vcpu_svm *svm)
> > > > {
> > > > 	struct kvm_vcpu *vcpu =3D &svm->vcpu;
> > > > 	struct kvm *kvm =3D vcpu->kvm;
> > > > 	struct kvm_sev_info *sev;
> > > > 	unsigned long exitcode;
> > > > 	u64 data_gpa;
> > > >=20
> > > > 	if (!sev_snp_guest(vcpu->kvm)) {
> > > > 		ghcb_set_sw_exit_info_2(svm->sev_es.ghcb, SEV_RET_INVALID_GUEST);
> > > > 		return 1;
> > > > 	}
> > > >=20
> > > > 	data_gpa =3D vcpu->arch.regs[VCPU_REGS_RAX];
> > > > 	if (!IS_ALIGNED(data_gpa, PAGE_SIZE)) {
> > > > 		ghcb_set_sw_exit_info_2(svm->sev_es.ghcb, SEV_RET_INVALID_ADDRESS=
);
> > > > 		return 1;
> > > > 	}
> > > >=20

Doh, I forget to set

		vcpu->run->exit_reason        =3D KVM_EXIT_HYPERCALL;

> > > > 	vcpu->run->hypercall.nr		 =3D KVM_HC_SNP_GET_CERTS;
> > > > 	vcpu->run->hypercall.args[0]	 =3D data_gpa;
> > > > 	vcpu->run->hypercall.args[1]	 =3D vcpu->arch.regs[VCPU_REGS_RBX];
> > > > 	vcpu->run->hypercall.flags	 =3D KVM_EXIT_HYPERCALL_LONG_MODE;
> > > > 	vcpu->arch.complete_userspace_io =3D snp_complete_ext_guest_reques=
t;
> > > > 	return 0;
> > > > }
> > > >=20
> > >=20
> > > IIRC, the important consideration here is to ensure that getting the
> > > attestation report and retrieving the certificates appears atomic to =
the
> > > guest. When SNP live migration is supported we don't want a case wher=
e the
> > > guest could have migrated between the call to obtain the certificates=
 and
> > > obtaining the attestation report, which can potentially cause failure=
 of
> > > validation of the attestation report.
> >=20
> > Where does "obtaining the attestation report" happen?  I see the guest =
request
> > and the certificate stuff, I don't see anything about attestation repor=
ts (though
> > I'm not looking very closely).
> >=20
>=20
> The guest requests that the firmware construct an attestation report via =
the
> SNP_GUEST_REQUEST command. The certificates are piggy-backed to the guest
> along with the attestation report (retrieved from the FW via the
> SNP_GUEST_REQUEST command) as part of the SNP Extended Guest Request NAE
> handling.

Ah, thanks!

In that case, my proposal should more or less Just Work=E2=84=A2, we simply=
 need to define
KVM's ABI to be that userspace is responsible for doing KVM_RUN with
vcpu->run->immediate_exit set before migrating if the previous exit was
KVM_EXIT_HYPERCALL with KVM_HC_SNP_GET_CERTS.  This is standard operating p=
rocedure
for userspace exits where KVM needs to "complete" the VM-Exit, e.g. for MMI=
O, I/O,
etc. that are punted to userspace.
