Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906173F105B
	for <linux-coco@lists.linux.dev>; Tue, 13 Oct 2026 17:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791912829; cv=none; b=YxN2J47OoEiL6qlOw7FZSsPNKwJI+iakKtt5V6xDRfZYZMK7EYAGETa85sYtSUVaRux/rXDwfdGtFaRgfcuYc7nTk+mvSzGSFjOroocnNMpQ0CRNcdrL57c+SvhI/e5ZjSSuhH3JHmwI7Kynlymr9bUqz4ePp96NDSu/BQxKCaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791912829; c=relaxed/simple;
	bh=m+i5mTlUxTCnrCi8WzAtmzzFXQV0rJfs+5MtNGiKS8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b7msHMnpsrjgMNrpztv0PdjPZivxVoHKt9KIpjChrmLaR/c93rVTqtlail472Ln4AZkCf3cdbT6zSS9NUx/oNdm+oeq2Xy/EzbEwhZ3JBCF9E8Dce51LfRpNfYje7TG2/CX+8r3HVpYAQTL1N1/LcDTfawwhJBNyGKSuSOO9q64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XQvQvPNo; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XQvQvPNo"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e8623790f8so160145ad.0
        for <linux-coco@lists.linux.dev>; Tue, 13 Oct 2026 10:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791912828; x=1792517628; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qsfJHJAdVQ83GKISdOFSgeXuIu/91TZW8ltTQ/2oo/k=;
        b=XQvQvPNoDgTtTOoma8mJCzM5EMQe+9XX4qNQmVkxvr8O6HYffFy4H/ItZYnCK6/ppa
         ZTf9e4qa9N00zTS6nCMzVF7VxuL7BrHXNYqKrpwE8Xaf0M+WpC9+SjNO95jGZ2dnhMOE
         N5vqTCgkW4+0BU8fZLODfZ34MAWQlsp98NvF49PzRusDoF54yi1hv2CjlHmVBMRbtV/g
         CF7HEVlun/N08c5Z9UT+9vSsDIUFVfRalmvq4OMXjjZ9htybkRNsdIAXHbcLPTYf2bEC
         Q1upJjpNW0EUVQCJ1uBK7+S7KKsUPD6JfHVJmzZr5fAvMQ0vUVKMHr7LFs4BkN+kb8eD
         MWWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791912828; x=1792517628;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qsfJHJAdVQ83GKISdOFSgeXuIu/91TZW8ltTQ/2oo/k=;
        b=VaPKQ5m/ck2wrNv1o7oWoSlMYVhfsC9gUpb/dS6UQWm+LMcS9Yhs4FFZL2zIVj0RoW
         S0axjQ7PiU8y+vUiFUANWbEBR70gYy2lCyfawc9UxALbX1leBaD4u4IAaLCRo644Jbbz
         NwOr7Z1M9NQQPVSCgiAktg5rgBL4gXsvlJXXck6pQzYvuKHg4KF0Ontgu2ITm3OUXI9g
         vl5LUUULeMH0kz/zL0iq9n4RPjrsTdZpa6g8Il7FjAWyqP6SAN3jDyhu3czV5VoMXoKM
         tW5XAchohojY6C51O2cv08UgmIy/v0CkJzcJZVjODt3y05cVayg57AtyW4espyidUnE+
         U//A==
X-Forwarded-Encrypted: i=1; AKwUvByuKEj9rEie0MlloT8fLirYkl8q2BNz51A/h0v/buzpusVFaohoifg61vFiDPFjObqnNq2wGxDB3puD@lists.linux.dev
X-Gm-Message-State: AFq9FYKrUbEG+5uwXjcrff9xr/D8eMEJB9kDTJnvUY5bNQozq6Mk5RU8
	UFFt+wsy+11cNZfm+Qcki5GW3YRunp5jYQgHlByDdmvQk7Hae/4MapzsheKCELi1Ew==
X-Gm-Gg: AYBFou3qT7J/ELf+MdLhoh6Wy31NU6mCT6YyE3qcCyNhz5i2zBrHtbCmi2xL/W74zvO
	2XZGlGkf9hnyj3cqiMju/MgGRFqdgmYNJUh3WWmUC46UyarD6Wh4cqa7AIH6aaZvE+TQpvtgIKW
	8qjvIt1BG1+zHUFOef+25lv/DXctqHEBiZRhuDw3REbebmntbqInFUJGx8KzcrC7xJlT6Ytco44
	nGjX/QHDRNvL2yWSDlDsNQdybFWJuTbiMA47ozBKrcUy1GxsszRriREsMOLyda1KPuZCkNtpP3w
	g6PR70SISkRdDlTwzt1knCUnYMK3o1caelU49S4sEgJrS4fR/ywK4KP5ftl43EahGVjl44baD/b
	caY5fSkAZpdJovzG5ThgeYDIStIN1h9AthR2RF+qM5Eq7M2t+txL+OT63/CBIQI1Va7J1LyMQWL
	E/kWmpr754ncC20SHQPlYXoT6rvu46TrYpLf2Lbx9vL3tPXcRwqVoUZHuNumrGk39TwORRi59YB
	pjLsRIabLq3r/qGTaBNyaXgowQJ2Zhf
X-Received: by 2002:a17:902:ebc6:b0:2e2:d665:6ad8 with SMTP id d9443c01a7336-2e87bc2190fmr12955725ad.4.1791912827258;
        Tue, 13 Oct 2026 10:33:47 -0700 (PDT)
Received: from google.com (75.57.168.34.bc.googleusercontent.com. [34.168.57.75])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac600a0619sm637262a91.7.2026.10.13.10.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 10:33:46 -0700 (PDT)
Date: Tue, 13 Oct 2026 17:33:43 +0000
From: Lisa Wang <wyihan@google.com>
To: Binbin Wu <binbin.wu@linux.intel.com>
Cc: Xiaoyao Li <xiaoyao.li@intel.com>,
	Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org,
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org, Andrew Jones <ajones@ventanamicro.com>,
	Ackerley Tng <ackerleytng@google.com>,
	Chao Gao <chao.gao@intel.com>,
	Chenyi Qiang <chenyi.qiang@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Erdem Aktas <erdemaktas@google.com>, Ira Weiny <iweiny@kernel.org>,
	Isaku Yamahata <isaku.yamahata@intel.com>,
	Kiryl Shutsemau <kas@kernel.org>, linux-kselftest@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Pratik R. Sampat" <pratikrajesh.sampat@amd.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Roger Wang <runanwang@google.com>,
	Ryan Afranji <afranji@google.com>, Sagi Shahar <sagis@google.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>
Subject: Re: [PATCH v15 14/23] KVM: selftests: Expose function to allocate
 vCPU stack
Message-ID: <as5rd8F3pLmimtGe@google.com>
References: <20261001-tdx-selftests-v15-0-7c62a5d8a992@google.com>
 <20261001-tdx-selftests-v15-14-7c62a5d8a992@google.com>
 <b2143700-da36-418c-af63-0b50b33f080e@intel.com>
 <932ec219-5951-489b-bda9-1f6e9a605a9b@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <932ec219-5951-489b-bda9-1f6e9a605a9b@linux.intel.com>

On Sat, Oct 10, 2026 at 11:54:42AM +0800, Binbin Wu wrote:
> >>  
> >> -struct kvm_vcpu *vm_arch_vcpu_add(struct kvm_vm *vm, u32 vcpu_id)
> >> +gva_t kvm_allocate_vcpu_stack(struct kvm_vm *vm)
> > 
> > Besides what Sashiko pointed out[1], this patch was just messed up during the
> > rebase and it even doesn't compile.
> 
> 
> Yes.
> 
> And since the upstream code already has vm_alloc_stack(), which basically does
> the same thing.
> 
> I think this patch can be dropped. 
> 
> > 
> > [1] https://lore.kernel.org/all/20261002091331.BA23F1F00893@smtp.kernel.org/

Yes.

vm_alloc_stack() can replace kvm_allocate_vcpu_stack(). I will drop this
patch in the next version.

Thanks!
