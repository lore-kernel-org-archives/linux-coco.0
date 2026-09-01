Received: from mta1.migadu.com (out-223.mta1.migadu.com [95.215.58.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A9D47140A
	for <linux-coco@lists.linux.dev>; Tue,  1 Sep 2026 08:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788249707; cv=none; b=aGistROQ/u+AKuA7onfGU7Eva16ogAVnk7TUpG6a+geqaHe2M9xOygrnihiId25J9W+KmC90zcfSlxXevrhfyPyFKjCun1FNmaT1L5zewM1gXBpfaSh0IFh0Wg9hOOvPHpHOkcEqvWkKr4lhVXZ4q6WKZHxrbIldm+HA6bRWFU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788249707; c=relaxed/simple;
	bh=3P9E5Gl1EjxsctRSZt48H99/ZpRYw60ocxNGWi1RFnI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TSDxLTwdlVgpXb4kijX+fb6R/x8j3wAOlJCGppTx/ZKTIGl8CN7JR3xHWxfXtLNdIjDpW2rKlRq8cGs8Vpi+/rVRInTCwt0nMJRbWuQVn12vSjQs+VSe2ymSQWwex0X2oAfyCF3aCsSZTiloqbLjhgOu0z2ylQNCFhwuMV1MHlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=h6zzSROx; arc=none smtp.client-ip=95.215.58.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="h6zzSROx"
X-Envelope-To: linux-coco@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=3P9E5Gl1EjxsctRSZt48H99/ZpRYw60ocxNGWi1RFnI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788249700; v=1; x=1788854500;
 b=h6zzSROxcV9dzDXplMeTmoA8oUr/282wnXh2eBojCPBH6qj73bOkVPBi7+INSHtir2mYFkMa
 DyKCTu8ZPkJk2sKttQBDk5tqt5k4YfCPBHQoQV0el339swMdIrF12wgJVPctc1BE4qlN1YeOECM
 IoOTxGqRO4GnlPX4bse4ytpA=
X-Envelope-To: linux-coco@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 6ed6e77cc487b009;
	Tue, 01 Sep 2026 08:01:40 +0000
X-Mizu-Trace-ID: 6ed6e77cc487b009
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5b2a8173142so3360e87.1
        for <linux-coco@lists.linux.dev>; Tue, 01 Sep 2026 01:01:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxfpJn1PKGtg5UokLv4vRIRPbrD1tKbCxa/IHxiFQH2HcJOEw+zyuNlpbxVAadIPenkZKDSpKg+Byxp@lists.linux.dev
X-Gm-Message-State: AFuF++nUlW/83djkGWKvykoxU3ouxEsIR3thH0ebNGpwmrhHpmCn2+iS
	Vs0BH2nKxBQP77Spkn2CYYxjyt8Skg12mqONZvV0Lt60QPu6rebR0jF1heRm5l/pA3jynHrcYMo
	EyHH/OYaMwzeDnlfUkKJFY9hn0cAnuJPXgwV9HzUs
X-Received: by 2002:a05:6512:3b0d:b0:5b2:a967:c0e1 with SMTP id
 2adb3069b0e04-5b5fefc71e5mr128710e87.0.1788249695751; Tue, 01 Sep 2026
 01:01:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260830-gmem-inplace-conversion-v12-0-85e5fd25252a@google.com> <20260830-gmem-inplace-conversion-v12-14-85e5fd25252a@google.com>
In-Reply-To: <20260830-gmem-inplace-conversion-v12-14-85e5fd25252a@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 1 Sep 2026 09:00:59 +0100
X-Gmail-Original-Message-ID: <CA+EHjTyU1Ldbw-qqdQOx_P8jrt85QEcKSGae2h+AahsDQdbmLw@mail.gmail.com>
X-Gm-Features: AcwNN1U1NN91vo14dSs3E4M2DDFHxxtZ_83sNMiwJfMd7svq3f7bIIAQvr3cTJo
Message-ID: <CA+EHjTyU1Ldbw-qqdQOx_P8jrt85QEcKSGae2h+AahsDQdbmLw@mail.gmail.com>
Subject: Re: [PATCH v12 14/45] KVM: guest_memfd: Add base support for KVM_SET_MEMORY_ATTRIBUTES2
To: ackerleytng@google.com
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, willy@infradead.org, wyihan@google.com, 
	yan.y.zhao@intel.com, forkloop@google.com, pratyush@kernel.org, 
	suzuki.poulose@arm.com, aneesh.kumar@kernel.org, liam@infradead.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
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
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Ackerley,

On Mon, 31 Aug 2026 at 01:25, Ackerley Tng via B4 Relay
<devnull+ackerleytng.google.com@kernel.org> wrote:
>
> From: Ackerley Tng <ackerleytng@google.com>
...
> +.. _KVM_SET_MEMORY_ATTRIBUTES2:
> +
> +4.145 KVM_SET_MEMORY_ATTRIBUTES2

This section number collides with the existing 4.145 (KVM_PPC_GET_COMPAT_CAPS)
below, so api.rst ends up with two 4.145 sections. One of them needs
renumbering.

...
>  4.145 KVM_PPC_GET_COMPAT_CAPS

Cheers,
/fuad
