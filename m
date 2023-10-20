Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9BE3369
	for <linux-coco@lists.linux.dev>; Fri, 20 Oct 2023 00:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VeHcaH0Q"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-1c9c83b656fso1775255ad.1
        for <linux-coco@lists.linux.dev>; Thu, 19 Oct 2023 17:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697760832; x=1698365632; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=MAD0GymonKhVp5idan/hQP/ZSGOOIuiLDIayqa/R+JY=;
        b=VeHcaH0QVYc80QriY09qce51z6pj8W85anSw3VL2WhwML8n8dxPYQdazZJNuxS98H3
         N/AZr2fHvonL5ulK8hTLCIjj2XYRgxSa6UCoWM19zrHVPOl6EwwMqHKCh75Ay4GSfRXa
         BRF32mcXf4JSk6Zp1pOKxoML//oHlakQymCbd7VNrseBgvnldG1MLkNp5C4L8hFedVEg
         OYPipsoOfNpVgcJcKR6PyUM//9EgYeTB1HH2bitaJaa1kjG4BnQWcG/9n2VXr8o468kH
         XE+QrzFwUzwzhjMwhIuKsuej3BahJEKHchOHZRBASpyQZ50m0RL/EIsK3Izy/QYQ5wiJ
         lOcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697760832; x=1698365632;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MAD0GymonKhVp5idan/hQP/ZSGOOIuiLDIayqa/R+JY=;
        b=LtTFGVasXwfGo1e7V8H9923lS9Hq/5a8BZZa3xZEDkkB0CPmX1zrcw8DvEUg3WIPgo
         4qmbhsOswarJHZgNpqIwfbxjJC3VwRiAa+uT7ArbaH6LMbVIcj04OwrCIw4+YZGqAHGY
         eMYmnidJpdM9/lsL92t4IhPoAGNmOrGoxwzhJSgOtdXeaWwttTy0Ko4bVv5tRdpQNrIe
         LX99eHtoT9eMn9RM+Wrt1gVY3QPJt1tEUMFb6/kSmYeX7YiEEhuu3UHKe2iWPFZSC5Va
         piJ/Mm4RzyflIP4oGb3hp4nmfTPgZeFuYaE929ds1gq7if5pSZV+nsbD0fmQ0nxzTJ+s
         OOfw==
X-Gm-Message-State: AOJu0YxiKTAngbfxHX8b3n6rEzMqjKm0+orLwWHd7r8/R4vyI0+qzt/O
	inblka0uBzHCIGhYvKEJAAOJtpkEuUU=
X-Google-Smtp-Source: AGHT+IFyYxrvznGGGQlvwIi5BcnD4kPqU6aMry2TjpSLSB2IZR8/8bU6BC4niY0jsoo5JMNhR/z1HTzXD5I=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:ab03:b0:1c3:4d70:6ed9 with SMTP id
 ik3-20020a170902ab0300b001c34d706ed9mr9607plb.3.1697760831964; Thu, 19 Oct
 2023 17:13:51 -0700 (PDT)
Date: Fri, 20 Oct 2023 00:13:50 +0000
In-Reply-To: <2034624b-579f-482e-8a7a-0dfc91740d7e@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20231016132819.1002933-1-michael.roth@amd.com>
 <20231016132819.1002933-49-michael.roth@amd.com> <CAAH4kHb=hNH88poYw-fj+ewYgt8F-hseZcRuLDdvbgpSQ5FDZQ@mail.gmail.com>
 <ZS614OSoritrE1d2@google.com> <b9da2fed-b527-4242-a588-7fc3ee6c9070@amd.com>
 <ZS_iS4UOgBbssp7Z@google.com> <924b755a-977a-4476-9525-a7626d728e18@amd.com>
 <ZTFD8y5T9nPOpCyX@google.com> <2034624b-579f-482e-8a7a-0dfc91740d7e@amd.com>
Message-ID: <ZTHGPlTXvLnEDbmd@google.com>
Subject: Re: [PATCH v10 48/50] KVM: SEV: Provide support for SNP_GUEST_REQUEST
 NAE event
From: Sean Christopherson <seanjc@google.com>
To: Alexey Kardashevskiy <aik@amd.com>
Cc: Dionna Amalie Glaze <dionnaglaze@google.com>, Michael Roth <michael.roth@amd.com>, kvm@vger.kernel.org, 
	linux-coco@lists.linux.dev, linux-mm@kvack.org, linux-crypto@vger.kernel.org, 
	x86@kernel.org, linux-kernel@vger.kernel.org, tglx@linutronix.de, 
	mingo@redhat.com, jroedel@suse.de, thomas.lendacky@amd.com, hpa@zytor.com, 
	ardb@kernel.org, pbonzini@redhat.com, vkuznets@redhat.com, 
	jmattson@google.com, luto@kernel.org, dave.hansen@linux.intel.com, 
	slp@redhat.com, pgonda@google.com, peterz@infradead.org, 
	srinivas.pandruvada@linux.intel.com, rientjes@google.com, 
	dovmurik@linux.ibm.com, tobin@ibm.com, bp@alien8.de, vbabka@suse.cz, 
	kirill@shutemov.name, ak@linux.intel.com, tony.luck@intel.com, 
	marcorr@google.com, sathyanarayanan.kuppuswamy@linux.intel.com, 
	alpergun@google.com, jarkko@kernel.org, ashish.kalra@amd.com, 
	nikunj.dadhania@amd.com, pankaj.gupta@amd.com, liam.merwick@oracle.com, 
	zhi.a.wang@intel.com, Brijesh Singh <brijesh.singh@amd.com>
Content-Type: text/plain; charset="us-ascii"

On Fri, Oct 20, 2023, Alexey Kardashevskiy wrote:
> 
> On 20/10/23 01:57, Sean Christopherson wrote:
> > On Thu, Oct 19, 2023, Alexey Kardashevskiy wrote:
> > > > 	vcpu->arch.complete_userspace_io = snp_complete_ext_guest_request;
> > > > 	return 0;
> > > > }
> > > 
> > > This should work the KVM stored certs nicely but not for the global certs.
> > > Although I am not all convinced that global certs is all that valuable but I
> > > do not know the history of that, happened before I joined so I let others to
> > > comment on that. Thanks,
> > 
> > Aren't the global certs provided by userspace too though?  If all certs are
> > ultimately controlled by userspace, I don't see any reason to make the kernel a
> > middle-man.
> 
> The max blob size is 32KB or so and for 200 VMs it is:

Not according to include/linux/psp-sev.h:

#define SEV_FW_BLOB_MAX_SIZE	0x4000	/* 16KB */

Ugh, and I see in another patch:

  Also increase the SEV_FW_BLOB_MAX_SIZE another 4K page to allow space
  for an extra certificate.

-#define SEV_FW_BLOB_MAX_SIZE   0x4000  /* 16KB */
+#define SEV_FW_BLOB_MAX_SIZE   0x5000  /* 20KB */

That's gross and just asking for ABI problems, because then there's this:

+::
+
+       struct kvm_sev_snp_set_certs {
+               __u64 certs_uaddr;
+               __u64 certs_len
+       };
+
+The certs_len field may not exceed SEV_FW_BLOB_MAX_SIZE.

> - 6.5MB, all in the userspace so swappable  vs
> - 32KB but in the kernel so not swappable.
> Sure, a box capable of running 200 VMs must have plenty of RAM but still :)

That's making quite a few assumptions.

  1) That the global cert will be 32KiB (which clearly isn't the case today).
  2) That every VM will want the global cert.
  3) That userspace can't figure out a way to share the global cert.

Even in that absolutely worst case scenario, I am not remotely convinced that it
justifies taking on the necessary complexity to manage certs in-kernel.

> Plus, GHCB now has to go via the userspace before talking to the PSP which
> was not the case so far (though I cannot think of immediate implication
> right now).

Any argument along the lines of "because that's how we've always done it" is going
to fall on deaf ears.  If there's a real performance bottleneck with kicking out
to userspace, then I'll happily work to figure out a solution.  If.
