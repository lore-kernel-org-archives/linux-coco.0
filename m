Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7FF137C38
	for <linux-coco@lists.linux.dev>; Mon, 20 May 2024 17:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716226527; cv=none; b=qyrIV31li3ArF6BuPZMZ+YdwgDYHfxhAAclujGeJ3HvD3dNYZgt62xGjJRS1IM4QhqOv8qMvijISqGR/PkwxmKwESRLhrXA6Iuv8WiObmGdEXMhW1dUAfZuXq7Fs3cUk5bv/9YE5eJguFJ/CHGpw6WbxyXSi1Va8aqGTGFfwm1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716226527; c=relaxed/simple;
	bh=+Tf6AAgN6OqFWz2TdMAtSycAZVzTLTZBPFUHsMMEnjI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UnCNw8Fri2jgHV4doPOlQirIUERQ3Vs7PYYtqwew0RIgmJZjpvq9ZUCfGzTDX+FH9iBla7bCw3MlgdBNcczdmYtaSe8O06WdQRTvrLsfU9Ll6F154+74tjgoUmz6VkRluneQrKBsGe9cHTV8V4VPb/h3LrKNmJKvcf13CXBznyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hN6jsRvG; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hN6jsRvG"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-1ed3b77d45aso136875205ad.0
        for <linux-coco@lists.linux.dev>; Mon, 20 May 2024 10:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716226525; x=1716831325; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=KaUIcbCxnT+V1tXho+s6VK2LQCpbrcFbVlZAjQNTw9w=;
        b=hN6jsRvGpx4tjadj+JMHVbYN3bK8uBZ6HNiH70lnwFoe3PVoyl456aUz+uSWGpTd+X
         ufzkPLqzkYmzCGo8XPP7KIEV9H5uEOkOc+3ei7WuwcLs2ozdIf1n6LxOjJGU7TpOIf1U
         78nE5mkZ17mRmynviLL/edIa6U/z1TFH+qPdf5RPOSrnCpVffSGKTeI3ISCkXV3ffHYl
         AfbtPEz9YcWKeYJtZsOjSEyT6dfXVJLaHEeyKrYm7tHG/irjERDtY1YilRLAPMAeABTu
         bmuJmwIQ/a+b3LenO3K8l/snBd7RgYSrfp2riVR/r57HZsHofLJHxeriVqgSTPG6U39x
         /EEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716226525; x=1716831325;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KaUIcbCxnT+V1tXho+s6VK2LQCpbrcFbVlZAjQNTw9w=;
        b=JTVJNvxm0kjeVpAwgKAB+iwxz+IxmWcHTOYt4GR5rx5Q3MfC7Jfe4VpFsxaAnKH0WJ
         Lg/lsv4d5XWbFNwYcCWmXFRE44bvWawGXP2ySqlu4EfoyvfWKuEEJg7kXtmfFSJohQX7
         qh9G2n3EOBE5duOHTJit9U1h4Yag4elJuzwLd0eUs1JA3GI7AXfZlZql/Aku4bLlurti
         CPLl6EZi4EA1h/jp7Ur46xTXrMkkjD8cBPAleG1R4J7sNtdDVx/q3RTPt6JVwIM0t2fq
         PWYkdzjGNwHMGA2zEN3uS0dLl/6PISpe073fyJyXlRZALN57RJo3gt0Tx2BoMN2f0YX8
         NbjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdoj+5qNmmR+OIFZ+ghUXlo8Zjn0vPXWilpF40chMfdMomILKiX8EVdXvYSpq3DO+Eq9+9ebMJZtyreh9k+gZ0sVlT5b+SDuO6pg==
X-Gm-Message-State: AOJu0Yysl9mYezYg/T8RbXunRpbps9+9mYZ19kRxWZ/mv77mneLkUCOB
	4cVy/QFVI/sk3utm6QrdNklkrtD3j2UKa/TEfbf13Mv9Q87Wc7jLSeUMlKzXbp2HskNHLNMrwbQ
	2Qg==
X-Google-Smtp-Source: AGHT+IF1taDRJctSSVr2IasIIziXIfKJNIigxZpYaoBlxwyY2AZlY80I/q2z0jdfLZJ5lT9JqTpQH1/QQSk=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:e749:b0:1f3:95f:ba6d with SMTP id
 d9443c01a7336-1f3095fc09fmr1015685ad.5.1716226525207; Mon, 20 May 2024
 10:35:25 -0700 (PDT)
Date: Mon, 20 May 2024 10:35:23 -0700
In-Reply-To: <41d8ba3a48d33de82baa67ef5ee88e5f8995aea8.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240501085210.2213060-1-michael.roth@amd.com>
 <20240501085210.2213060-14-michael.roth@amd.com> <41d8ba3a48d33de82baa67ef5ee88e5f8995aea8.camel@intel.com>
Message-ID: <ZkuJ27DKOCkqogHn@google.com>
Subject: Re: [PATCH v15 13/20] KVM: SEV: Implement gmem hook for initializing
 private pages
From: Sean Christopherson <seanjc@google.com>
To: Kai Huang <kai.huang@intel.com>
Cc: "isaku.yamahata@gmail.com" <isaku.yamahata@gmail.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	Rick P Edgecombe <rick.p.edgecombe@intel.com>, "michael.roth@amd.com" <michael.roth@amd.com>, 
	"pankaj.gupta@amd.com" <pankaj.gupta@amd.com>, "tglx@linutronix.de" <tglx@linutronix.de>, 
	"tobin@ibm.com" <tobin@ibm.com>, "liam.merwick@oracle.com" <liam.merwick@oracle.com>, 
	"alpergun@google.com" <alpergun@google.com>, Tony Luck <tony.luck@intel.com>, 
	"jmattson@google.com" <jmattson@google.com>, "luto@kernel.org" <luto@kernel.org>, 
	"ak@linux.intel.com" <ak@linux.intel.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>, 
	"pgonda@google.com" <pgonda@google.com>, 
	"srinivas.pandruvada@linux.intel.com" <srinivas.pandruvada@linux.intel.com>, "slp@redhat.com" <slp@redhat.com>, 
	"rientjes@google.com" <rientjes@google.com>, "peterz@infradead.org" <peterz@infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"dovmurik@linux.ibm.com" <dovmurik@linux.ibm.com>, 
	"thomas.lendacky@amd.com" <thomas.lendacky@amd.com>, "x86@kernel.org" <x86@kernel.org>, "bp@alien8.de" <bp@alien8.de>, 
	"vkuznets@redhat.com" <vkuznets@redhat.com>, "vbabka@suse.cz" <vbabka@suse.cz>, 
	"ashish.kalra@amd.com" <ashish.kalra@amd.com>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, 
	"nikunj.dadhania@amd.com" <nikunj.dadhania@amd.com>, Jorg Rodel <jroedel@suse.de>, 
	"mingo@redhat.com" <mingo@redhat.com>, 
	"sathyanarayanan.kuppuswamy@linux.intel.com" <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	"hpa@zytor.com" <hpa@zytor.com>, "kirill@shutemov.name" <kirill@shutemov.name>, 
	"jarkko@kernel.org" <jarkko@kernel.org>, "ardb@kernel.org" <ardb@kernel.org>, 
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"

On Mon, May 20, 2024, Kai Huang wrote:
> On Wed, 2024-05-01 at 03:52 -0500, Michael Roth wrote:
> > This will handle the RMP table updates needed to put a page into a
> > private state before mapping it into an SEV-SNP guest.
> > 
> > 
> 
> [...]
> 
> > +int sev_gmem_prepare(struct kvm *kvm, kvm_pfn_t pfn, gfn_t gfn, int max_order)

...

> +Rick, Isaku,
> 
> I am wondering whether this can be done in the KVM page fault handler?

No, because the state of a pfn in the RMP is tied to the guest_memfd inode, not
to the file descriptor, i.e. not to an individual VM.  And the NPT page tables
are treated as ephemeral for SNP.
