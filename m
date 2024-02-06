Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C72F1B81C
	for <linux-coco@lists.linux.dev>; Tue,  6 Feb 2024 20:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707252717; cv=none; b=BzSoBrmusz+Iq8gHl7GNeG5iEXbT0J5zpwDbvzIB1DkDH/Sn4U/5zhb1oe14dA9na/I5p8Ps90U9FJonMaLKUPa7v3DgxBe60IxT1880qrx0/Qau3yN2cAZqvszEhWJwlYjn5ZSknl63zZVhIMy9lYRM4qjvUoNUccWU5Xx52Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707252717; c=relaxed/simple;
	bh=6f6Qix6f+UWdfRaPzaX+crwa5ujk+FHt0PxZzVbTk2g=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=rEZrniUGT6Moo1VMKcW4FP8hP0raMRu42wVQLC86KTOHaza+GgxLVbS3AHkmHoSBSKx4AQJENdLyQSvWs+KKy5OvcGLsc/Dq5NcBfo2R0MO66ffLCftyc8ZDlTMTErKhT8DUaQYZ1cRPQjKt+tU5fHMMW1rOYGBmJ3Gmxcf8Wow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LS6h2mf3; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LS6h2mf3"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-1d94c2a3d07so58371975ad.3
        for <linux-coco@lists.linux.dev>; Tue, 06 Feb 2024 12:51:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707252715; x=1707857515; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=JwbhYZHR4hW4due82eTme97f04XbIaf6d9EPvYJz5x8=;
        b=LS6h2mf3nFrxVJIZvW9shrJjIaFTnj10FviN+BSABK6DPuS05fwXjOFGDPmATRU2Q0
         pmPi0h2a5TG0uG8GN8EXu51tdx6oyMHY5sY+oVh7vICl5TIACyzUu8M7VcR2TNJm4opR
         Wuxh+Z3M/WlIz+2mFXfYtzRBNk2mhXPCRcomslx9P0kXv4WwYR/Y/6OVWmCz2h0YyXox
         N1EPtXRBSUd5N6HnLH7/oVk2NEf5Gx45RpG+y7nTpFazpwK8M9DdOuM3dzvW+I5z2SD8
         cGa/u04tiJ1HeZ0vncE6fLs6LReqgmxBS6//AZAwAeawBsbeRLJNlrofTDwhRwubttsv
         QySQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707252715; x=1707857515;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JwbhYZHR4hW4due82eTme97f04XbIaf6d9EPvYJz5x8=;
        b=eGByZJsF4jPStWwMKZadBcRemKacyPFqZYDm4KKfpIxDL+fBL9xwUepQoDrjsUF9Lk
         mLywtVPYh42cE27PyTzUfcm/0SA5hFS2kE/xpsClmzqZXeXL1UUTPMITCJdGFpK20847
         pGahZBuiSTfMOJy2cLBReudD0JwOzrUVcCrfXEm6zbOuUHAyX3hied+dsYWBh0PuvifK
         oz9x8pMhSph/CEnaCFv+ToZr5IxQBf3F7M1JFLldGY0Hh85RWyC/OrCa7abjwGzdXsLN
         HB3pEbC6KiBLVlXAHvSYo9W6Gyz2BTmSX5e4OK2W5j17QYCNKM1kANS1nGQZVWPY0UPd
         XUjA==
X-Gm-Message-State: AOJu0YxYZa1sWlJrDvkBk/alYf/DQS3v5aeBMVLiJaLYxzTfFez6+rDk
	yKt+OP5vOUvP4y0VbwGWpWZcAAghEYRpW/QG7Kgtt/NzEGSgxdNk4LiLs+6lS2oOjUNMxD8DJgw
	N0g==
X-Google-Smtp-Source: AGHT+IEj5phGVut6P7UH0HGT2jn7IqSaGP6JthmOgqjg9ZskUGjauEK3HLRpFSTg5biILz4Q+Ty+BMdRsZg=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:d510:b0:1d9:ae91:7b50 with SMTP id
 b16-20020a170902d51000b001d9ae917b50mr8028plg.7.1707252715474; Tue, 06 Feb
 2024 12:51:55 -0800 (PST)
Date: Tue, 6 Feb 2024 12:51:53 -0800
In-Reply-To: <20231230172351.574091-7-michael.roth@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20231230172351.574091-1-michael.roth@amd.com> <20231230172351.574091-7-michael.roth@amd.com>
Message-ID: <ZcKb6VGbNZHlQkzg@google.com>
Subject: Re: [PATCH v11 06/35] KVM: x86/mmu: Pass around full 64-bit error
 code for KVM page faults
From: Sean Christopherson <seanjc@google.com>
To: Michael Roth <michael.roth@amd.com>
Cc: kvm@vger.kernel.org, linux-coco@lists.linux.dev, linux-mm@kvack.org, 
	linux-crypto@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, 
	tglx@linutronix.de, mingo@redhat.com, jroedel@suse.de, 
	thomas.lendacky@amd.com, hpa@zytor.com, ardb@kernel.org, pbonzini@redhat.com, 
	vkuznets@redhat.com, jmattson@google.com, luto@kernel.org, 
	dave.hansen@linux.intel.com, slp@redhat.com, pgonda@google.com, 
	peterz@infradead.org, srinivas.pandruvada@linux.intel.com, 
	rientjes@google.com, dovmurik@linux.ibm.com, tobin@ibm.com, bp@alien8.de, 
	vbabka@suse.cz, kirill@shutemov.name, ak@linux.intel.com, tony.luck@intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, alpergun@google.com, 
	jarkko@kernel.org, ashish.kalra@amd.com, nikunj.dadhania@amd.com, 
	pankaj.gupta@amd.com, liam.merwick@oracle.com, zhi.a.wang@intel.com, 
	Isaku Yamahata <isaku.yamahata@intel.com>
Content-Type: text/plain; charset="us-ascii"

On Sat, Dec 30, 2023, Michael Roth wrote:
> In some cases the full 64-bit error code for the KVM page fault will be
> needed to determine things like whether or not a fault was for a private
> or shared guest page, so update related code to accept the full 64-bit
> value so it can be plumbed all the way through to where it is needed.
> 
> The accessors of fault->error_code are changed as follows:
> 
> - FNAME(page_fault): change to explicitly use lower_32_bits() since that
>                      is no longer done in kvm_mmu_page_fault()
> - kvm_mmu_page_fault(): explicit mask with PFERR_RSVD_MASK,
>                         PFERR_NESTED_GUEST_PAGE
> - mmutrace: changed u32 -> u64
> 
> Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
> Link: https://lore.kernel.org/kvm/20230612042559.375660-1-michael.roth@amd.com/T/#mbd0b20c9a2cf50319d5d2a27b63f73c772112076
> [mdr: drop references/changes to code not in current gmem tree, update
>       commit message]
> Signed-off-by: Michael Roth <michael.roth@amd.com>

I assume Isaku is the original author?  If so, that's missing from this patch.
