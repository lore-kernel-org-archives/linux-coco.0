Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57BE528507E
	for <linux-coco@lists.linux.dev>; Tue, 22 Jul 2025 23:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753225658; cv=none; b=s/mA1gDgI2r4fWLUejJsDwyv/8Dm0IDY+qxm76KwEJ/1GHz/qKVmKpVbA5QwXaHbkj2lxi2xbmZyjSeZ95jPIfX5eC0zn6tRWNYfnsWMui2ObN1Aq9MCANdcd1qqdHStMSkC6pyYS84Cdbav4eGKJu71RzzZeaa7W6Yf10lN028=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753225658; c=relaxed/simple;
	bh=i9Topy5p8+oRB1ybTn3eGTjAdmW4So/zy81PHcCSQws=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=h0FONT6Tf0guroLc43nXpFeS1/4n1j320UJc1uVgf0K0RYN57pZPqrg1gF3v/uDOEAuUy8RwLYLHa0cVQuQ5PVMZCueeqr4M34fm3mbCBsUfAhfABd8zFg7en3g/aBjP5Vm1Up31pXJWZeuyfpSXVTCtxjZp5YChmjckP6jefME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nQELYTs6; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nQELYTs6"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b31c38d4063so4242688a12.3
        for <linux-coco@lists.linux.dev>; Tue, 22 Jul 2025 16:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753225657; x=1753830457; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=f+m6qI30JHvrm3ONaGCpQMi0L8lxI7PYDb1Mu/Pb3F4=;
        b=nQELYTs6VyYYivBwye1Eo5WdToI3xSLShtjev7G1PJSKBMu3NQYlMbo6YebfW5geln
         MkYrkTBzy/+g1dkRVcxQyQGh0ExIBj+/SiC680xz5K5yyp70aPuhaoUSnGzmaBuK0T0d
         2dYcSBJIuuXEpAFEWZmunr4rrniBTYa+D4KrPkPcc3kAdKCGyTmj1wKocdNLE1Q3jivW
         RSfsat3yXELFsaaH/VkTjytcC1XKcEAHrT+DesZknsYylWnUV8v0p1vUrgjMPXxhr9YI
         jCcpd3QKw6WhcS/R6ojNoUelZ07KuwBSIxgBX7H64/1zGHz6LLwLaSvrV1gCrx0Bm834
         Jtdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753225657; x=1753830457;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f+m6qI30JHvrm3ONaGCpQMi0L8lxI7PYDb1Mu/Pb3F4=;
        b=YbM5zssTUntVBThKblLwtPkR83cAyN8USRah1iyDTbIGuPs63ai9iyxdxnT/FLOnVY
         8nzFqvC4LL78QRC/pb4PGObHSqz/jXeKdRBK8+tK5sPE9Zb7L2gzhZroLvxxxSnzeGzQ
         qFdPxzCGOAI0p+nmHsvyTIbFLrSW2QGbEX+L3/IUSesrm+RgKEOjnMR0ZLmX2FdoIBEV
         Ve68j2y23+71qAOXEqyHsiJtVi27H0/i8czdxb/+Ca3hTjc+1SqSdSqeV5SFTpsmdXuA
         IJRWqoGMhBTTVTUEvpFhxrbotSA2HiEvS48D4iZ1zi2HUd5N5tNH/KG7EMOaSTzot9k0
         N19g==
X-Forwarded-Encrypted: i=1; AJvYcCX2mXjphSM2/NcRdasr54lgHlOuWGUxemwUAbkDzuhUc7g6V/EH6TZyfiybxnP0bO/QKn59SOAqJeqU@lists.linux.dev
X-Gm-Message-State: AOJu0YyS+5gfPNSoeSwW5Awl5foXjW7nKnwBYqiD3qTAbFls8ZMtGBcg
	C+XOm9AkMAnTRnssD5s4qPIgdnv/WWgXEATybSMqLfgT26Wljl4TpRctBT6b3HdOZtEbvshHUWt
	DstQJsg==
X-Google-Smtp-Source: AGHT+IFOb8KYXXobVAAvvjW+Fe1YbH8mwfp6V2E801ROWDybd0+20juthdBHS5x4qZEtLjQQN6CpBVqzr4M=
X-Received: from pjuj4.prod.google.com ([2002:a17:90a:d004:b0:313:242b:1773])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5647:b0:311:fc8b:31b5
 with SMTP id 98e67ed59e1d1-31e507abbc6mr1697551a91.14.1753225656408; Tue, 22
 Jul 2025 16:07:36 -0700 (PDT)
Date: Tue, 22 Jul 2025 16:07:34 -0700
In-Reply-To: <80a047e2-e0fb-40cd-bb88-cce05ca017ac@redhat.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250713174339.13981-2-shivankg@amd.com> <bdce1a12-ab73-4de1-892b-f8e849a8ab51@redhat.com>
 <aH-j8bOXMfOKdpHp@google.com> <80a047e2-e0fb-40cd-bb88-cce05ca017ac@redhat.com>
Message-ID: <aIAZtgtdy5Fw1OOi@google.com>
Subject: Re: [PATCH V9 0/7] Add NUMA mempolicy support for KVM guest-memfd
From: Sean Christopherson <seanjc@google.com>
To: David Hildenbrand <david@redhat.com>
Cc: Shivank Garg <shivankg@amd.com>, vbabka@suse.cz, willy@infradead.org, 
	akpm@linux-foundation.org, shuah@kernel.org, pbonzini@redhat.com, 
	brauner@kernel.org, viro@zeniv.linux.org.uk, ackerleytng@google.com, 
	paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com, pvorel@suse.cz, 
	bfoster@redhat.com, tabba@google.com, vannapurve@google.com, 
	chao.gao@intel.com, bharata@amd.com, nikunj@amd.com, michael.day@amd.com, 
	shdhiman@amd.com, yan.y.zhao@intel.com, Neeraj.Upadhyay@amd.com, 
	thomas.lendacky@amd.com, michael.roth@amd.com, aik@amd.com, jgg@nvidia.com, 
	kalyazin@amazon.com, peterx@redhat.com, jack@suse.cz, rppt@kernel.org, 
	hch@infradead.org, cgzones@googlemail.com, ira.weiny@intel.com, 
	rientjes@google.com, roypat@amazon.co.uk, ziy@nvidia.com, 
	matthew.brost@intel.com, joshua.hahnjy@gmail.com, rakie.kim@sk.com, 
	byungchul@sk.com, gourry@gourry.net, kent.overstreet@linux.dev, 
	ying.huang@linux.alibaba.com, apopple@nvidia.com, chao.p.peng@intel.com, 
	amit@infradead.org, ddutile@redhat.com, dan.j.williams@intel.com, 
	ashish.kalra@amd.com, gshan@redhat.com, jgowans@amazon.com, 
	pankaj.gupta@amd.com, papaluri@amd.com, yuzhao@google.com, 
	suzuki.poulose@arm.com, quic_eberman@quicinc.com, 
	aneeshkumar.kizhakeveetil@arm.com, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"

On Tue, Jul 22, 2025, David Hildenbrand wrote:
> On 22.07.25 16:45, Sean Christopherson wrote:
> > On Tue, Jul 22, 2025, David Hildenbrand wrote:
> > > Just to clarify: this is based on Fuad's stage 1 and should probably still be
> > > tagged "RFC" until stage-1 is finally upstream.
> > > 
> > > (I was hoping stage-1 would go upstream in 6.17, but I am not sure yet if that is
> > > still feasible looking at the never-ending review)
> > 
> > 6.17 is very doable.
> 
> I like your optimism :)

I'm not optimistic, just incompetent.  I forgot what kernel we're on.  **6.18**
is very doable, 6.17 not so much.
