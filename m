Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0DC0402420
	for <linux-coco@lists.linux.dev>; Thu, 13 Aug 2026 18:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786646452; cv=pass; b=fvCYuihfZKDejIA/WosslZV0quH+fw5DSuuE1o28IpnDXUdWUm4qwBD/xA3UGRTPryuznu7Yvtur78khFzJQLN9a58SbA5XHShgAtkaOOLiMaCZLx02rIWTt0om2QL6rj2OvBj9W5ZUjNDEjFSUOlWl1FtCJDdcsO6dMCp2Z900=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786646452; c=relaxed/simple;
	bh=SmuHUPl640dUfP/T8wiC16wCTI5Yqb/6dnMHylHeXNU=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wo8dJsZNV3L1t5L7Te5uPh24XGZ+SP2NHBm3+JU1OLTqIvHqcYaNeOo8J7fdPdvNdOdL3HFxr/FS35JhqIVCtn+Ju43XVRKeh6M48ibiOZzmsY8ER5vQ+0tehLDtxldAk4ydDyCxbAMXYR6uoGUzeeXORsHNtR01LFQoSDz6LuY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RQ2xJDgP; arc=pass smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RQ2xJDgP"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38e08baf860so155558a91.2
        for <linux-coco@lists.linux.dev>; Thu, 13 Aug 2026 11:40:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786646450; cv=none;
        d=google.com; s=arc-20260327;
        b=hS3Mr30i2OS5LgKKqQ478Ri3gYtd0tf2UE2A3l5sj+1t6SUrRMZ37KRTzQr5F1axHR
         swwxIeO9CRXFY09+TFRnoWo/l0BkMw+zOua/DJ0opghcOMkmwwhI/5o3T0RxKPhQ5HUO
         61skZCeDyo4vXrSz6wzMMvf5ZNLoJtRsyAej0eUoCSkbxrYbdhqEArtCOW+RPELU8Clx
         dz/74+yJMcCt+XYRTxd36sJgstBqGJmOcqVBgPVQRcv9SEE9+vXbFtRhofzWgYKXiiCe
         rvvfngmp6ZOX49zmGarL2RegCMXPE14MwxLSNFgD/26KaGQP4Tf9cIFYqy0wB8asHkA8
         UeUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=FfCarHoh7qSi7mQScz0h/iOmFe8yy6xC72Pgonixm98=;
        fh=SiDuaybXAcHWyLm6/yDHHR2Dcz/eNAH5kgHuFtVxxyw=;
        b=BXKZCBGbv8e3w131RmP/3WWU/W3PEOiA9MZrYnYfhLK3NF+fHI1/U7xMJ820n+zoJl
         ByGvl8ao+wDbyy0WtnjgnYYl3RnfgA0L0duKoBSrnLErQ32BvWHthmipQgyuz6i0Lo3O
         T9h4l5sCwjusFGVJogZMjXKiJCh/J4BhxTqu4xDIGLYI0Mi9yr8RvqFS6BITzQzEOkQY
         JMQLuNsGCiocBw373tOIXlECHELde50SAQMbpceULd73Ta7Tn0cO3hQ9zZA9e2I0oWzs
         skKtjgK1TM34NvUfYuBR0GykqUTjH6Aj/hF6g5d9upLgZt2tr9fs59XMPnFkASOq8U/a
         7rqw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786646450; x=1787251250; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FfCarHoh7qSi7mQScz0h/iOmFe8yy6xC72Pgonixm98=;
        b=RQ2xJDgPd31eieg8CKzVLCgc3LlyKMtoBt6rkzgCc3QZE7CIRgBpTvp8P6Nn/08+Xc
         q0Sza6PHkpNM0gXAzydsKkH9yspn9pCuv9iJpIGlwDGGG+tKg3fG3e+yikJCu4QcIWWC
         DlF9XpTqvyVa+vhPAL3xcYGWzxzvSXJUJgj1lBMaBiMAziw2S7c05boT8J5i9HRISxDR
         dwMux/LLdeo6PzebTt3GXqJJuzgQGNW9zd9aSi3A6gvm4WfKmgX/c+mZWbCDVmgbgH9A
         gQkl0QmwzJ4n+KT2c4GODkP69fsDDMqvz8dQs5mUHo1amwTWuQfccuhPTIIXr1/BJgfW
         exqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786646450; x=1787251250;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FfCarHoh7qSi7mQScz0h/iOmFe8yy6xC72Pgonixm98=;
        b=IBtoqHasz9Ix42JNxA1chH8mb1mhJCh91xBUVv79OxSa3q+EhWawGmYPinyNi9XgKs
         frKrwRsiote9UcZBSBuizX+dm+2G/CRg51EUA4e8L4tGd0ruxlMpovbacGxhm2o3Sn9j
         w9YEFZA7MzRGjF0/oJ4FNP0RKEaU1oqAQRsWHggALVaJZNOoMGhWtHtBghSFSmfmAVP5
         dOcmEFqlj+tXD3khkOsbkm+iUfQMWcKXgn5NRN2NUjnS7zYxoU2BW/Nrme1hd3DCCQZc
         2Z5AZ+JElIUj261zX9VfHqnNOV9XzhU83bMfWeqWHcQMtPRfCRa6koMhV9YEmM5FFF8O
         3pzA==
X-Forwarded-Encrypted: i=1; AHgh+Rql9H43nx6enyBMbXhu6UYwykj2HUfiUZLhD38FjLJWRGKF2+1vBFQ6zWZ0UYiZTOEhJg2RnosA2d8f@lists.linux.dev
X-Gm-Message-State: AOJu0Ywk1iJUWlvIH6kA0fFpJS7uF3O6oNrVO1awomRrdLGUS0CrMIss
	jH7zY1Ye08wOTLNmUTlrHxh+NpyTdQpyKG88JBMUxBjieczk2O1536MsjaGNwxn1F2lGDnLvUEa
	4cm3AFnNv+Sm3xajOAeS7dBJDrLynVcYTZ2gGCK2X
X-Gm-Gg: AR+sD12NYC636XQpS8FMDQnsw8w5upSkipRR1jNk5yfWGoz2vlzcPburkeBoErnXgsg
	1qKn+r3MFtB7k+/NRWI5BmuQ7FNXumK/6Zkx+WEVBKlyDBDO74X9Aot+ETEtFdiytqia1ov/34/
	MFOcdY1wOI3DzENIDtFVxqJAPerDbgYeFFJ+HOPyBL59lUFIs7l0aiXyPbf1Ej8u1aKIYxQjYSF
	EqwJ0RXCfiZMlm9VUVY9fI0xmAOQMFjWnYWvNKmhUKuAi18aKi+tIVJvGLNSQNI/ZwumzjtBXLe
	ekTRleqmp2K6IWBMkeQTaspOsj0j5nFQVdbGQL+XSjUjjPeleg8jfyEqF0qPTvStfS4+HdFxnV3
	SEEcfKEl1yk+8QNrV069VRKKUfwRpnvQ=
X-Received: by 2002:a17:90b:1c03:b0:38e:2860:253f with SMTP id
 98e67ed59e1d1-3931e25f24fmr8532991a91.12.1786646449351; Thu, 13 Aug 2026
 11:40:49 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 13 Aug 2026 11:40:48 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 13 Aug 2026 11:40:48 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <cc44c9d7-a6cd-40a5-9f68-4822fb9c9d0c@intel.com>
References: <20260807-gmem-inplace-conversion-v10-0-2fc18ee6d3ba@google.com>
 <20260807-gmem-inplace-conversion-v10-7-2fc18ee6d3ba@google.com>
 <ed483d25-d908-4248-b8c7-862dd35dc6d4@kernel.org> <annnrGR1noVuBkCc@google.com>
 <cc44c9d7-a6cd-40a5-9f68-4822fb9c9d0c@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Thu, 13 Aug 2026 11:40:48 -0700
X-Gm-Features: AUfX_mwbi2KKm_8JKoJYp71B4rnhRB-DpUSQbtCK9ZlqdFzmBXno1Ngt_qJ6KFA
Message-ID: <CAEvNRgFd-6-QxR7w8SxPRa0UU+AAF7pDupLP8cPbQ9y3m=2QVw@mail.gmail.com>
Subject: Re: [PATCH v10 07/41] KVM: guest_memfd: Stub in ability to enable
 in-place shared<=>private conversion
To: Xiaoyao Li <xiaoyao.li@intel.com>, Sean Christopherson <seanjc@google.com>, 
	"David Hildenbrand (Arm)" <david@kernel.org>
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, jmattson@google.com, 
	jthoughton@google.com, michael.roth@amd.com, oupton@kernel.org, 
	pankaj.gupta@amd.com, qperret@google.com, rick.p.edgecombe@intel.com, 
	rientjes@google.com, shivankg@amd.com, steven.price@arm.com, tabba@google.com, 
	willy@infradead.org, wyihan@google.com, yan.y.zhao@intel.com, 
	forkloop@google.com, pratyush@kernel.org, suzuki.poulose@arm.com, 
	aneesh.kumar@kernel.org, liam@infradead.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
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
	Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Xiaoyao Li <xiaoyao.li@intel.com> writes:

> On 8/10/2026 11:01 PM, Sean Christopherson wrote:
>>> As mentioned in v9, the name is confusing.
>>>
>>> 	kvm_gmem_mem_is_private
>>>
>>> ?
>> Ya, +1 to kvm_gmem_mem_is_private.
>
> So kvm_gmem_mem_is_private() calls kvm_gmem_is_private_mem()
> internallly. Ummmm.

How about

  kvm_gmem_mem_is_private(kvm, gfn)
  __gmem_mem_is_private(inode, index)  <== this is a static function
                                           anyway, though it calls
                                           kvm_gmem_get_attributes(inode, entry)

or

  kvm_gmem_gfn_is_private(kvm, gfn)
  kvm_gmem_is_private_mem(inode, index)

  (rename the vm stuff with the suffix gfn_is_private())

or (current, it is actually weird)

  kvm_gmem_mem_is_private(kvm, gfn)
  kvm_gmem_is_private_mem(inode, index)

or

  kvm_gmem_mem_is_private(kvm, gfn)
  kvm_gmem_index_is_private(inode, index)
