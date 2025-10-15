Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E108D3254B5
	for <linux-coco@lists.linux.dev>; Wed, 15 Oct 2025 21:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760564764; cv=none; b=ANDuNPy1fozYSM+xrg3Uc9gpe/ABvzIrwxAUWoF29mPK7RUEZFkzmsnVDkmjfkZPpcM9fzsCmgIXYHGaAc6F52lbGJc1wBVbP+m3FIjTfHkhIYt2X4Wa5voPQoqVk4NGvyj737g+oqV0TjVzLth4wfwIR8foTSPsE+UZeJUL3k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760564764; c=relaxed/simple;
	bh=4aIc9dx+BqTIrEkxhdIkDUsdv2I7S3jqyih5WAzO4pU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mjiSjWey9r1XdwHYijncmzX0+8FcKQKbUQvEcSEUplf5Gesibwiz7MCCT3qYMC/0dM0NuZ/BDRGGbyeWvgpgM4ChoQOw9AsqbsMftyRhCUC4qQ9M9lrZ36PCf2CgJ1WFsNgZ49MOuqCgHnHAg3jUTNjJO+zY5h3j9s1qSuEFByk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=ggpeCMRx; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="ggpeCMRx"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-85a4ceb4c3dso6346985a.3
        for <linux-coco@lists.linux.dev>; Wed, 15 Oct 2025 14:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1760564762; x=1761169562; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=L3FMg1FEv7ZUbFziIBjfrlMH5r4d6/IdcxKlJL9nOzQ=;
        b=ggpeCMRxjn3XjgeAyOt9m0+ZKM4Rwbe6DR/7sDcQlJ1HhBOZq4PiJTTsdNybo94E0H
         z5H2qELM/cGdpaOrTsbIuvYfXTIAyGK19xFvFZl/DZMcBDAx3I+WyR5bCBEuXtm5xAm7
         HHGNX61VqJ9T5ORVjIcYXAYSQ5J9TLK7r1K5wtLYkHcOluR9j07cUkU3TsTn4To0xl10
         zkuoWOzfN8EZGk9629iIarzxMrEcRSYVQOQrKlP9oROvdT/8dNiyRr0uWaQIp183Arkq
         2tCbal2lNWy3HZBb5kC0e33FTc6HFr9xh+keJhnCDcr2Th5P3d7i1gVxjf5kgns/z+Ic
         oLNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760564762; x=1761169562;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L3FMg1FEv7ZUbFziIBjfrlMH5r4d6/IdcxKlJL9nOzQ=;
        b=b3NELES9v1nmof9+635LCnjyJUFtrYY1nRkeydcS1UHazet8/ywAqapHbrgbXa557E
         oo8IND1UfQNEPa525Byd8pILW4ELP8ene3Bh7YIGfbBASpH1caDy6lCmwP08ZUgww6k4
         kjjGRhm6B2Izld3wHJjb75AuHy89+drgz7wEXzcw2rtiSfSLqzHodl4bAmud/0tcW+Jh
         NzBPrEC8FgzixAM2d2uOwlGZNjoe1G6KAt1xiM5j53wFbJDdlkmCd8sL6HhdmGCcUPv7
         vXpAS3YI2i9t2FhUzHmaibtoCd36MTU8qsqinZYVNfLrmd1Om8cGeuaEd/EnOHwN7s3r
         vocg==
X-Forwarded-Encrypted: i=1; AJvYcCVIkvcY5uNHJy77tx4sVimcgAwypc7s4kC1ptu2xQmrxi/wmfaJbFKY3iNszgHcze9ColwHT7DKdS1J@lists.linux.dev
X-Gm-Message-State: AOJu0YwneQPqxEIpz3RPrv8wdmMoOampackBzEGyK9E/u6nC8OKChoAa
	K3GUKRl1LhhWdWg1ubMZLKr6Yx16rcqEfSbWxEsVlapFkAMkHBWikANbAEqB3AljlbQ=
X-Gm-Gg: ASbGncvPbRc+eE2U/sGj4NA3ij4RU6BLxI9MvUgPnbUVD6VpQFlbRKr0CsxAN20QWtw
	uHGFNTPR02Olc5lvHHN8/pW5nPuB+Wv+yKf8QxHb7lhsYA5q9AjyRZMQ2xrUxBGnffCcDxZtisW
	7bZR2LiAoqTMajH/AHdxKOaA2PChefO/EP8bJQ4rYwFMApUhRz6EG5aLB19EIkavnFmYgd0pLTa
	r2OM3mn1EBUzc3zzm3is0C11F+U3pa8TCnCsbObkpN58Dm/KKo7MjdKY6sJ0eDeVLvqSmn2hZ3/
	zPXvC/Z/jLvUvcB1HhNCwiiaU4z6arz3bnW7lDXL20PSv+2d5L/64v5wxlG4xTyLdSTKaXnBQyL
	Sc5u6kvXj9yJHn92LCb13zgtzNkdvFm8WNTxiepgm4qRuih54PSmLXC4mUpBEk2SpBahAXkFcqR
	cpsOiSrxUARTNkO2K/Qc1y8uTDrn2NNP9sQ85YMvYwbKhfA5M4uBdgNxLOCBgNa3c9gS+P4w==
X-Google-Smtp-Source: AGHT+IGFaJmIXEF9qOWREfnISohaPtcOawCiX32gOo0axLN0cRb3DCKNrFn66v9UE7KAPGfO0N4wTQ==
X-Received: by 2002:a05:620a:1a02:b0:88e:86a3:98f1 with SMTP id af79cd13be357-88e86a39b78mr380325385a.45.1760564761659;
        Wed, 15 Oct 2025 14:46:01 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-96-255-20-138.washdc.ftas.verizon.net. [96.255.20.138])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-88f37e50ebasm56360985a.31.2025.10.15.14.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 14:46:00 -0700 (PDT)
Date: Wed, 15 Oct 2025 17:45:57 -0400
From: Gregory Price <gourry@gourry.net>
To: Sean Christopherson <seanjc@google.com>
Cc: Shivank Garg <shivankg@amd.com>, jgowans@amazon.com, mhocko@suse.com,
	jack@suse.cz, kvm@vger.kernel.org, david@redhat.com,
	linux-btrfs@vger.kernel.org, aik@amd.com, papaluri@amd.com,
	kalyazin@amazon.com, peterx@redhat.com, linux-mm@kvack.org,
	clm@fb.com, ddutile@redhat.com, linux-kselftest@vger.kernel.org,
	shdhiman@amd.com, gshan@redhat.com, ying.huang@linux.alibaba.com,
	shuah@kernel.org, roypat@amazon.co.uk, matthew.brost@intel.com,
	linux-coco@lists.linux.dev, zbestahu@gmail.com,
	lorenzo.stoakes@oracle.com, linux-bcachefs@vger.kernel.org,
	ira.weiny@intel.com, dhavale@google.com, jmorris@namei.org,
	willy@infradead.org, hch@infradead.org, chao.gao@intel.com,
	tabba@google.com, ziy@nvidia.com, rientjes@google.com,
	yuzhao@google.com, xiang@kernel.org, nikunj@amd.com,
	serge@hallyn.com, amit@infradead.org, thomas.lendacky@amd.com,
	ashish.kalra@amd.com, chao.p.peng@intel.com, yan.y.zhao@intel.com,
	byungchul@sk.com, michael.day@amd.com, Neeraj.Upadhyay@amd.com,
	michael.roth@amd.com, bfoster@redhat.com, bharata@amd.com,
	josef@toxicpanda.com, Liam.Howlett@oracle.com,
	ackerleytng@google.com, dsterba@suse.com, viro@zeniv.linux.org.uk,
	jefflexu@linux.alibaba.com, jaegeuk@kernel.org,
	dan.j.williams@intel.com, surenb@google.com, vbabka@suse.cz,
	paul@paul-moore.com, joshua.hahnjy@gmail.com, apopple@nvidia.com,
	brauner@kernel.org, quic_eberman@quicinc.com, rakie.kim@sk.com,
	cgzones@googlemail.com, pvorel@suse.cz,
	linux-erofs@lists.ozlabs.org, kent.overstreet@linux.dev,
	linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, pankaj.gupta@amd.com,
	linux-security-module@vger.kernel.org, lihongbo22@huawei.com,
	linux-fsdevel@vger.kernel.org, pbonzini@redhat.com,
	akpm@linux-foundation.org, vannapurve@google.com,
	suzuki.poulose@arm.com, rppt@kernel.org, jgg@nvidia.com
Subject: Re: [f2fs-dev] [PATCH kvm-next V11 6/7] KVM: guest_memfd: Enforce
 NUMA mempolicy using shared policy
Message-ID: <aPAWFQyFLK4EKWVK@gourry-fedora-PF4VCD3F>
References: <20250827175247.83322-2-shivankg@amd.com>
 <20250827175247.83322-9-shivankg@amd.com>
 <aNVQJqYLX17v-fsf@google.com>
 <aNbrO7A7fSjb4W84@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aNbrO7A7fSjb4W84@google.com>

On Fri, Sep 26, 2025 at 12:36:27PM -0700, Sean Christopherson via Linux-f2fs-devel wrote:
> > 
> > static struct mempolicy *kvm_gmem_get_policy(struct vm_area_struct *vma,
> > 					     unsigned long addr, pgoff_t *pgoff)
> > {
> > 	*pgoff = vma->vm_pgoff + ((addr - vma->vm_start) >> PAGE_SHIFT);
> > 
> > 	return __kvm_gmem_get_policy(GMEM_I(file_inode(vma->vm_file)), *pgoff);
> 
> Argh!!!!!  This breaks the selftest because do_get_mempolicy() very specifically
> falls back to the default_policy, NOT to the current task's policy.  That is
> *exactly* the type of subtle detail that needs to be commented, because there's
> no way some random KVM developer is going to know that returning NULL here is
> important with respect to get_mempolicy() ABI.
> 

Do_get_mempolicy was designed to be accessed by the syscall, not as an in-kernel ABI.

get_task_policy also returns the default policy if there's nothing
there, because that's what applies.

I have dangerous questions:

why is __kvm_gmem_get_policy using
	mpol_shared_policy_lookup()
instead of
	get_vma_policy()

get_vma_policy does this all for you

struct mempolicy *get_vma_policy(struct vm_area_struct *vma,
                                 unsigned long addr, int order, pgoff_t *ilx)
{
        struct mempolicy *pol;

        pol = __get_vma_policy(vma, addr, ilx);
        if (!pol)
                pol = get_task_policy(current);
        if (pol->mode == MPOL_INTERLEAVE ||
            pol->mode == MPOL_WEIGHTED_INTERLEAVE) {
                *ilx += vma->vm_pgoff >> order;
                *ilx += (addr - vma->vm_start) >> (PAGE_SHIFT + order);
        }
        return pol;
}

Of course you still have the same issue: get_task_policy will return the
default, because that's what applies.

do_get_mempolicy just seems like the completely incorrect interface to
be using here.

~Gregory
