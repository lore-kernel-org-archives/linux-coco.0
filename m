Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F5A33EB17
	for <linux-coco@lists.linux.dev>; Thu, 24 Sep 2026 22:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790289092; cv=pass; b=KQ5tyBDaW2LgqBYbtoXZlIxIneM8Ln76bJqS8HJ+tTbKssRmF54g3faZb96A+R8Z82+yld3ifMmBQKzQgsQf+by/qlvJxVJaDoUos8qY7WNQhhNk0aW4Xvqe5VhGkMRWxBErckr+AYBwoxwFeXxHOYC3fCHJ/grPNYC/BfZ8H6I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790289092; c=relaxed/simple;
	bh=QyHE3recU+YgckuL/EubHuVec7rhNZz4z30xRjcK4e0=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nru0Pvn2JrDORdovFwwgJbhFSHvVrP3WM2E9BXANon8YjeKucd0FdsBD7aVr9OyKW83KXVRtYaN9jSOwOcD59Sa60Zh95PVUuiZR77zbL/p6Qo73e1ql1yOEbzq7mSKOr4f9HdJu1r/EJP0T6LCzwSJ2Rue7pWnc2c60kyEgOUc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LNxkal27; arc=pass smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LNxkal27"
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-939109f067fso35870885a.2
        for <linux-coco@lists.linux.dev>; Thu, 24 Sep 2026 15:31:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790289089; cv=none;
        d=google.com; s=arc-20260327;
        b=OlLUgfVpk400I+l1Xpb8zcjvjW3n7Bn2haVg/73XV+FGKuvu6nVQ83DQZMBhLrvLBa
         maN0NN55StONhhTSu67wpTMqVSyCRGy3Bq7SK2XxKD8+Vvf010xzrC1uKhkysPCHD65P
         MCS9DZIbvqoHogBR5sqeU70/plE0isGSWuSfvx+Dliz9/BNLBSMY6d85zIWtPy3IeLlP
         OmD5JyYXH7sSFgiiPaEeCdmgen1wq1uTwQUXX8w9dIgIyk6BzdKkOE0oi1lPjkd+kcBW
         PkQ6xMX/9+G0GNpOA+rnriWP8Xf1JkDwBrFEzgYFrSVWDwzLSBmKGo2E5mC4EuImfZUk
         8ekA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=KLxQ1V7eKFjM5hpU7Dk8oYI/it/LXUSsiWfbILSfCAs=;
        fh=4iLnzFRfYYT+uNk1jcLctcTghOI1Svaed9pUWrmO3L8=;
        b=l7isKQ3N+vuCa389vn+Np+gXPv2xbPTF1AxjbtgmwdgDn7TKafbl7c6AS6TDT66vzW
         U+lNjoNXah33+lJ1U/naYpGBaSxiKX2CpD2PdmTCpbyQDLVLiiz38hkBaBOTuoePNRyK
         h8gI8Y7ApLDOmMv++lS9dDoPj9kv0iabrDIqhcSC/3MkBAWmZN/UHdHzW8etY46Ha7bl
         sSNv1o8r52cN5jxB/m9gpMBZZ5tMrht+635H9eTMf3zKDW6O8kFcEmNhfHvoIyZFRA6L
         XDXbXjYJOvecWKwG+Fkz49CloYaon+dOWUl4KqrhQALr/dSw+zSlEeIWFZYLfJqXF9id
         Ix8Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790289089; x=1790893889; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KLxQ1V7eKFjM5hpU7Dk8oYI/it/LXUSsiWfbILSfCAs=;
        b=LNxkal27IUXP7VgyV9TLnzUU5FrHj0cHnpnGdNXCoWlZqbRrKXAtO3ROfW7tZcE9y6
         FOmEyBN+zHazQ9lCuMC3joHFWW5aUz1eiqpxO97go+sBKxFBUlZAEtZMcwjH8Et1RcjU
         ch9Wp2//fEeXmCjlr/767Vj9yFuNegWU/L8/cZxg4hP0SkY+1J3MNRsqNLdTiXiF0RwZ
         Ui5jrJ3+t5CkN9L4Yn2iocxd7Dy1LnhwOJW5mY0uRscLWdiGtnY3luThKnXKqwKBUclO
         LxiZP9UeFkRQNsj7cmr8g+pex7GU8f4NIEqn8Hz7twUc7dWYtXQS+seug9dkxnm0xKwh
         9N1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790289089; x=1790893889;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KLxQ1V7eKFjM5hpU7Dk8oYI/it/LXUSsiWfbILSfCAs=;
        b=XmwyOotiE/Wq96HlWeyD47WpF/lKx/Y03UwHBWdrQ7Gkhy+I/cIPUkcP6A7wXvlS/V
         juPZLPL5dC7u3Umqn9MgYEMnpXehBeRF3/pCPa4iE3MVcLSqa4+r+ddVYIA7wx/ktCwD
         4K9/TpGULxFFn2yFQUoGt9HoVHEvHnjVW2me40Ffof/EiDIrUH4EDAuTRd7N+XRR5qCz
         KASAEN53apOAYNpIAYYqblE2UQ42ZW5EGt60Nruas4f27L5AypRtJjIvk2rfTPgJlqEP
         WFWX87zlwRZB94xVzHI7/Oi8L5YqP3+xjoYEUyZwYE4KJLy+gt4AYDIYBybaLo1vdhXb
         J6IA==
X-Forwarded-Encrypted: i=1; AKwUvBzo5YCVMlivNNqJXYU4zVEKlttAQdtMzIVXHL9J92Ng7pYU2kzQApGT/2HInhJZt8kQuTASVv/CFwlq@lists.linux.dev
X-Gm-Message-State: AFuF++m5tH8J+rckW7xxT/MV8v5NPyrxu8swrGqfh9JwoF7ELc5gBvPo
	NO/kMqA8YUOy0hfwLF4iwEJTXHPAW0MewA0DqD+H6dK2jV95vogizVhNEYjNqVrSkiLUhRQX6Qz
	fxyGugqG9xDx79mFz+jdBE22FuI24vNBbX1jq2pXV
X-Gm-Gg: AYBFou1z6o1enfuuLG2B1e4W1uhyR/FGxmPwmxaoVeVXuih7FimnhCq/RCZRGb4+qby
	bht6h54Q9vtO7eDpw4yOGJ+iFw0CNOZXIrT2i5CmEH5iVjtbuWXY/NHXblxsEbiaHS+tNVNGqom
	WdxRYxpDp5J7BPGtubeLkzWNi9xFgem4RpehUo43+ql8P1ALEH69B0+nw9vfhGXqZRvke+JRSl8
	wR0T2ElwinCbQ04RJ8sznpX9suuIrnTBUeNW1LNIJHM8N6xrjghPvUdsFt83DQdzcY6q/17sahl
	vscgcldI/nfZ54pAg7LTcgdmlM7jKTG00G0F++duF410/709ZDuPRv9t3Nmx306RJxv/ftRdYm3
	JI1SDB/y6GnZmvniHjFTxcoa1CJt8APxjT8GwXFri9g==
X-Received: by 2002:a05:620a:2b93:b0:936:eeab:307e with SMTP id
 af79cd13be357-93c43cc5676mr141474285a.9.1790289088659; Thu, 24 Sep 2026
 15:31:28 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 24 Sep 2026 15:31:27 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 24 Sep 2026 15:31:27 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <179028368162.2007072.12117327378679658047.b4-ty@b4>
References: <20260910-gmem-inplace-conversion-v13-0-dd6fbf94f4e1@google.com> <179028368162.2007072.12117327378679658047.b4-ty@b4>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Thu, 24 Sep 2026 15:31:27 -0700
X-Gm-Features: AclHuK8DxWsVWtzA-dbMsis8Esd8BT_dOvi97JucFF4AgqprHJknTuuePlOITb0
Message-ID: <CAEvNRgFpMwduvHPGJ5fLoVPr_iGn=ELzY4AcMGHESC6CkMyeTw@mail.gmail.com>
Subject: Re: [PATCH v13 00/44] guest_memfd: In-place conversion support
To: Sean Christopherson <seanjc@google.com>, aik@amd.com, andrew.jones@linux.dev, 
	binbin.wu@linux.intel.com, brauner@kernel.org, chao.p.peng@linux.intel.com, 
	david@kernel.org, jmattson@google.com, jthoughton@google.com, 
	michael.roth@amd.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	shivankg@amd.com, steven.price@arm.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
	liam@infradead.org, Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Baoquan He <baoquan.he@linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>, 
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, tarunsahu@google.com, 
	Randy Dunlap <rdunlap@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Fuad Tabba <fuad.tabba@linux.dev>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev, Xiaoyao Li <xiaoyao.li@intel.com>
Content-Type: text/plain; charset="UTF-8"

Sean Christopherson <seanjc@google.com> writes:

> On Thu, 10 Sep 2026 16:55:26 -0700, Ackerley Tng wrote:
>> Here's v13. Thanks everyone for the comments and fast responses!
>> We're now at ~3 weeks to soft-close at 7.3-rc5.
>>
>> v13 is based on 7.3-rc2 and:
>>
>> + Hugh's patch to export lru_cache_drain_for_folio()
>> + Another series [1], which makes kvm_gmem_get_pfn() NOT return a
>>   refcounted page to KVM.
>>
>> [...]
>
> Applied to kvm-x86 coco.  A *huge* thanks to everyone who helped with this!
>

Thank you so much everyone!

>
> [...snip...]
>
