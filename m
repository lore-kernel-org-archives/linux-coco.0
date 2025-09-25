Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CAD82ED14C
	for <linux-coco@lists.linux.dev>; Thu, 25 Sep 2025 23:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758841978; cv=none; b=tbhcVhcUAbAz+yTsWENC7KTmPL6xGX5uCUhv4u+dFbW6NYkIFBnp375/BP8AzY5FzyY7KIJQK5FOwQun4bjDaQhxF791Nq5dsnI4gwN81HRQKR59CZS75XK6IDiM2Lg9AhZLo+y03n0ELd2pP6/ern3dr74CVoTnWwbBB9JVnUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758841978; c=relaxed/simple;
	bh=s9eeTE4+TFjXly65mL70gO5Nj1aP2Sg3pnQCFQVgq5c=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=uPkTQ4TwCTjDbPzNLACRLlvNYmlimm4hkyByTMGJXwe4HHbEGS4+0fXK+qSR1wtw2j6bD5ajOZ4yGkyIqxfW1LEeESImrrPwsGTnz9Us1Bqw6AajvpgpXqEjpHjDC0BXpJWnJXNtD57VB0Lngdb/ybGHP/iFwO79TEfi9xIq7Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wZEi952/; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wZEi952/"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b57e477760dso205295a12.2
        for <linux-coco@lists.linux.dev>; Thu, 25 Sep 2025 16:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758841976; x=1759446776; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=XGCCSnKnyPGGdnUTp10aKL37FULfLm3dyeD1VoFdI2I=;
        b=wZEi952/FpP9vjBve7Fex1fftiYayFkxf+JBm9wo/TYWlK37gAYunC/LV9XXYaY9MP
         WTA0DTUis0GFlc3axHRRbq9E6Oo9SJjqwidIe8B8jzXbddUa/dUgVauI/1dInVZtnGXm
         dkAqn+yBhV0MiJ4yn1WvzhgUhvbuNrFEZTtM0mU4Q9rAmJzjD6vCNNa91O2SEVVwsM/a
         +SWDwnRNX5QIlvXzz91pWYkdPP4EBQ+xt85EsNoibW9nohAVIgxuCiVEMn0NJ9Wbp8Us
         KRUG6qJQQW40lIRjXFsl94rDpCAvvVgIEhHnopqkU+DIyI9akdSpSB5cqs4NSkoj4DJO
         SNGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758841976; x=1759446776;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XGCCSnKnyPGGdnUTp10aKL37FULfLm3dyeD1VoFdI2I=;
        b=g0Pvh8EnewSr/O7D8Bv+ub+5iJ8rUMVoi3IJjDhM/tNAnu3woRSfUitdOjUvl9HP7f
         OEPie4DUnauoZIyCbCtgkG4Uz2K44F0Qls6ZAF6Y6Hvqdn4KHUoQdRKkHhDYLfEBFa/G
         fY3IyJ7a4uj1z/Yujm+14DcWc1KCR8Et69R5gdxA3cJahB7/4MA9bvqtNEro3OpYkCqA
         EeA7s43njaPvi6c/IeM5EGSekNkernpYyfLd0vgrpdb2qVoubvnQM4ARhPWs3M5dz4nt
         G7UlWtcXhDpbk5Uzutq/Gi+M76/cYrZIuo9GZ5k2tVdaXSFwnKGeQS1t81ymGxny3tOj
         LGeA==
X-Forwarded-Encrypted: i=1; AJvYcCUdu38WrPTOLazmWX3GWL2630q2ZHFaUWl+ifpd+hwedNWHpYCL5VDRggfz1Pcwy8wPB7kICcmTWeFQ@lists.linux.dev
X-Gm-Message-State: AOJu0YzKkZE42XPBvKivlZk40YvCNt3bygbqfZTpG0Gm3YsK5/aQDY7K
	N3PCxjl44XQCKA0cTl3zv3owCQnMENyP3Z6eWdVNQplXr8urjR+VneYJIiZ8xkLmMzej2AxudfI
	RnNRL3A==
X-Google-Smtp-Source: AGHT+IFE8gFtFdnHNmX2p6THQrFO41fYST4gwotcfBj6rGswgxHnE9CG8NuKci3w5GnRskLMvJFI/+Q8X0o=
X-Received: from pjbjz6.prod.google.com ([2002:a17:90b:14c6:b0:330:9af8:3e1d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e883:b0:262:79a:93fb
 with SMTP id d9443c01a7336-27ed4a7ecbdmr51468535ad.32.1758841975402; Thu, 25
 Sep 2025 16:12:55 -0700 (PDT)
Date: Thu, 25 Sep 2025 16:12:53 -0700
In-Reply-To: <20250925230420.GC2617119@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250827175247.83322-2-shivankg@amd.com> <20250827175247.83322-10-shivankg@amd.com>
 <aNW1l-Wdk6wrigM8@google.com> <20250925230420.GC2617119@nvidia.com>
Message-ID: <aNXMdSZkqDtsGRLm@google.com>
Subject: Re: [PATCH kvm-next V11 7/7] KVM: guest_memfd: selftests: Add tests
 for mmap and NUMA policy support
From: Sean Christopherson <seanjc@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Shivank Garg <shivankg@amd.com>, willy@infradead.org, akpm@linux-foundation.org, 
	david@redhat.com, pbonzini@redhat.com, shuah@kernel.org, vbabka@suse.cz, 
	brauner@kernel.org, viro@zeniv.linux.org.uk, dsterba@suse.com, 
	xiang@kernel.org, chao@kernel.org, jaegeuk@kernel.org, clm@fb.com, 
	josef@toxicpanda.com, kent.overstreet@linux.dev, zbestahu@gmail.com, 
	jefflexu@linux.alibaba.com, dhavale@google.com, lihongbo22@huawei.com, 
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, rppt@kernel.org, 
	surenb@google.com, mhocko@suse.com, ziy@nvidia.com, matthew.brost@intel.com, 
	joshua.hahnjy@gmail.com, rakie.kim@sk.com, byungchul@sk.com, 
	gourry@gourry.net, ying.huang@linux.alibaba.com, apopple@nvidia.com, 
	tabba@google.com, ackerleytng@google.com, paul@paul-moore.com, 
	jmorris@namei.org, serge@hallyn.com, pvorel@suse.cz, bfoster@redhat.com, 
	vannapurve@google.com, chao.gao@intel.com, bharata@amd.com, nikunj@amd.com, 
	michael.day@amd.com, shdhiman@amd.com, yan.y.zhao@intel.com, 
	Neeraj.Upadhyay@amd.com, thomas.lendacky@amd.com, michael.roth@amd.com, 
	aik@amd.com, kalyazin@amazon.com, peterx@redhat.com, jack@suse.cz, 
	hch@infradead.org, cgzones@googlemail.com, ira.weiny@intel.com, 
	rientjes@google.com, roypat@amazon.co.uk, chao.p.peng@intel.com, 
	amit@infradead.org, ddutile@redhat.com, dan.j.williams@intel.com, 
	ashish.kalra@amd.com, gshan@redhat.com, jgowans@amazon.com, 
	pankaj.gupta@amd.com, papaluri@amd.com, yuzhao@google.com, 
	suzuki.poulose@arm.com, quic_eberman@quicinc.com, 
	linux-bcachefs@vger.kernel.org, linux-btrfs@vger.kernel.org, 
	linux-erofs@lists.ozlabs.org, linux-f2fs-devel@lists.sourceforge.net, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"

On Thu, Sep 25, 2025, Jason Gunthorpe wrote:
> On Thu, Sep 25, 2025 at 02:35:19PM -0700, Sean Christopherson wrote:
> > >  LDLIBS += -ldl
> > > +LDLIBS += -lnuma
> > 
> > Hrm, this is going to be very annoying.  I don't have libnuma-dev installed on
> > any of my <too many> systems, and I doubt I'm alone.  Installing the package is
> > trivial, but I'm a little wary of foisting that requirement on all KVM developers
> > and build bots.
> 
> Wouldn't it be great if the kselftest build system used something like
> meson and could work around these little issues without breaking the
> whole build ? :(
> 
> Does anyone else think this?
> 
> Every time I try to build kselftsts I just ignore all the errors the
> fly by because the one bit I wanted did build properly anyhow.

I'm indifferent, as I literally never build all of kselftests, I just build KVM
selftests.  But I'm probably in the minority for the kernel overall.
