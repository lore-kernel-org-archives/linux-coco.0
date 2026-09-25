Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B039C47ECEB
	for <linux-coco@lists.linux.dev>; Fri, 25 Sep 2026 22:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790373869; cv=none; b=UwbUnvSweVm/OVfZ4yZjZt+HYII3U2G5FfkWX3NIt/m7984X4kkNICyU1g2nhaYOCOLHzF/nCUNmdsXHz+DrgZ1oCU/kbfGT55+uDSiFKJzm7I++8eFOUtfXsrUXJ/08altunk1FXbOPgD7TwwhVTAvWEWD43wcjZe7gXrdI6cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790373869; c=relaxed/simple;
	bh=HAP/sFklTJPiQKLsjznjzZZN3nbst3jpCvp5m9djKik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k59xNjjqL5jxlFT44s3dGVLuiqqaoxnMztRMGBAnqK2PFF4y+HveBpvOklBdL6gU8Be1E87dA3bcmfWJOVwKhMWHDj0RM2MVmjfAs9Xqt2tdWWczZ54YcdQKe7heRkV3i/+vghPdbG63t2IZFYqiPMVTZyhKPxTh+UID9XH+rM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=azmM7G/W; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="azmM7G/W"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2d8fd7a3f38so10995ad.1
        for <linux-coco@lists.linux.dev>; Fri, 25 Sep 2026 15:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790373868; x=1790978668; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ksyuSwUH2dGx1asD3+Rht2rW0CHu4s19+UlL6wUtms0=;
        b=azmM7G/WSmZbWJVFFOMLwjoDpUWSkx3IY3DTnDt76y8lgShGizmBWp180usY4j9qPQ
         SxmeYkW9IAwTXO9qKHPfrgJ64QM09iFWDNyYBrYAKRpTpP3K2IvIdUPwfMEl5kBMOEWy
         u63fuxy1fENRYdbyt9CTai/An14rCzU1p1uaF1hCNU8ppiPufXf012whx7vXNegFcCQb
         l0D/m2XAUNCK9M6ov/l6c7uT7HdFt9mXcNfgYau2Zs4pTemW5Gb5Il0LALGN1dfeopUS
         bjHOalFPbKjAdrEalHnCgPRJP8ydSCv0o3/QdHSKJd2Z+yLvO7bQ1h3XwuKBUBseWaY+
         8Q+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790373868; x=1790978668;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ksyuSwUH2dGx1asD3+Rht2rW0CHu4s19+UlL6wUtms0=;
        b=PhkvcRMgJiIEWRCr6LAQz0Meos89BdU/HTCFHp7IZWim1WQfueM/bdK7W6el7Vb7T2
         rvpZMAbSTZg8hjTJywes1IGB2BOW/CZhWv/3lccafi9P50TjqoK3OVfs+ztQf4Yr+qfG
         YuTYM7mnqxQ0O7knsNfg+qNFyXWVeJ9FzT5TXRQKDnrtmC5FP7hjixZcWzeXkcdAMlob
         wFQfHE38fLl0hTnbeIYHDHkgNZ4/6YTFaITZMMEfv6HlKpiq0dQd4SDNXF96M1FCM2Eu
         Omx5oJBKRJcDylSr4L9kAljsBRSM3OM8ECUW+SgNI9s0NI9KIoYmlwxbZR8aBtafHId9
         /m+g==
X-Forwarded-Encrypted: i=1; AKwUvBzsWemu+6/HLw5pQ6vbytlmwYJD5p7kAG1u//ido565+YATDLmbS4QsiI+lVFcbdzGLy7h3XXgO/GmM@lists.linux.dev
X-Gm-Message-State: AFuF++k9perou2Kvx+xezyQvXNtvtSxBFYzyHkhkb4Zftrqz33sTqBRU
	MhiCXMDyDmFqv/ibHw0hYR2N1xiJVw7G+JWKaybjhbr3HpEPNMt8jfnbhGcPh0IvZg==
X-Gm-Gg: AYBFou3uhAYOidn1mPdk6EbYVq0VSFSVr5Er0eXqlQOEmSeGq0iOasHUDWybm/Nt9JN
	hH6vH6QEJ5c6FSJ1qvIshnEEba2ZAZEKlAx6K2svA+QviT6bGWht1un2/WSEAGhGvKHlUeJKJuf
	NZx0KZ6KZCmVXUR1KwaHAykEMfgBudXDBQI6oCr4qATM0PdFuTEN7yzxbbLShUVP8Jn5biKHP3b
	iasuEP7ascochSG+XSKnxrDkqrpuoJFS0DC7dVzT6adxbJbHIsbEyMPWjFDlSrYOb5qxwU87Xmm
	y84++7D76ihjeaglDcT02K2HqQMAOBZWnxYsZ8DRCF18fsa9rTIiYBw5pKecC99PCLQXj1eQx4t
	9YaJ1oYEQoCufv5sQD/17KhKVfce5keiPHgKf2zJ1hdBKMopvRY+rb5mB7/dOTdpQ3RZGYECh4R
	1eyTBeFIV+tIE94XIAE34EH0qDdJa5npINoHkYLHp59YFZ7nC7pHym7tk8igkZ7XnsPdVh2ekAA
	VLRiXDAeyFlZNFfl7rj+OHvIk/pXfNj
X-Received: by 2002:a17:903:46c6:b0:2c9:d89f:fd98 with SMTP id d9443c01a7336-2dfa968787fmr718815ad.1.1790373866593;
        Fri, 25 Sep 2026 15:04:26 -0700 (PDT)
Received: from google.com (230.0.127.34.bc.googleusercontent.com. [34.127.0.230])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a097663fd0sm12373594a91.9.2026.09.25.15.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 15:04:25 -0700 (PDT)
Date: Fri, 25 Sep 2026 22:04:22 +0000
From: Lisa Wang <wyihan@google.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Ackerley Tng <ackerleytng@google.com>,
	Binbin Wu <binbin.wu@linux.intel.com>,
	Chao Gao <chao.gao@intel.com>,
	Chenyi Qiang <chenyi.qiang@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Erdem Aktas <erdemaktas@google.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Isaku Yamahata <isaku.yamahata@intel.com>,
	Kiryl Shutsemau <kas@kernel.org>, linux-kselftest@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Pratik R. Sampat" <pratikrajesh.sampat@amd.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Roger Wang <runanwang@google.com>,
	Ryan Afranji <afranji@google.com>, Sagi Shahar <sagis@google.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org,
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org
Subject: Re: [PATCH v14 12/22] KVM: selftests: Require guest_memfd for TDX VMs
Message-ID: <arbv5jEZ439Yo_UE@google.com>
References: <20260722-tdx-selftests-v14-0-15ad654a50db@google.com>
 <20260722-tdx-selftests-v14-12-15ad654a50db@google.com>
 <ef53ccf8-00c4-4a50-985e-425a2d40583d@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ef53ccf8-00c4-4a50-985e-425a2d40583d@intel.com>

On Fri, Aug 14, 2026 at 03:42:48PM +0800, Xiaoyao Li wrote:
> >   static bool is_guest_memfd_required(struct vm_shape shape)
> >   {
> >   #ifdef __x86_64__
> > -	return shape.type == KVM_X86_SNP_VM;
> > +	return (shape.type == KVM_X86_SNP_VM || shape.type == KVM_X86_TDX_VM);
> 
> Instead of updating is_guest_memfd_required(), I'm thinking how about just
> replacing is_guest_memfd_required() with vm_arch_has_protected_memory()?

vm_arch_has_protected_memory() returns true for SEV, but an SEV VM is
expected not to use guest_memfd. If we replace is_guest_memfd_required()
with vm_arch_has_protected_memory(), we need an extra test to ensure
SEV VMs work well without guest_memfd.

Thus, I prefer keeping is_guest_memfd_required().

> > @@ -27,6 +27,7 @@ static struct ucall_header *ucall_pool;
> >   void ucall_init(struct kvm_vm *vm, gpa_t mmio_gpa)
> >   {
> > +	struct userspace_mem_region *region;
> >   	struct ucall_header *hdr;
> >   	struct ucall *uc;
> >   	gva_t gva;
> > @@ -37,6 +38,13 @@ void ucall_init(struct kvm_vm *vm, gpa_t mmio_gpa)
> >   	hdr = (struct ucall_header *)addr_gva2hva(vm, gva);
> >   	memset(hdr, 0, sizeof(*hdr));
> > +	region = vm_get_mem_region(vm, MEM_REGION_DATA);
> > +	if (region->region.flags & KVM_MEM_GUEST_MEMFD) {
> > +		size_t aligned_sz = align_up(sizeof(*hdr), vm->page_size);
> > +
> > +		vm_mem_set_shared(vm, addr_gva2gpa(vm, gva), aligned_sz);
> > +	}
> 
> this diff about the ucall needs to be a separate patch. What's the reason to
> add it to this patch in this version?

Thanks. Will separate in the next version.

> >   	for (i = 0; i < KVM_MAX_VCPUS; ++i) {
> >   		uc = &hdr->ucalls[i];
> >   		uc->hva = uc;
> > 
> 
