Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C40655C312
	for <linux-coco@lists.linux.dev>; Wed,  9 Sep 2026 14:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788965568; cv=pass; b=oerBKcn3z9nSWXP+tUgAJvQcjoGMmnG/4tiqXyLC3waashQKYgx+Kpi+Lj5SM6kVW8MhTeb5u+7rjwI+gaTxLHZUVBQ9qUZeA1pHa597/FwsTUM/chXN+KNlStTS8wqgVgcsvml6Dq+m1+10D+2UsGXc+RBAU1o8ikLmzkQugPw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788965568; c=relaxed/simple;
	bh=nlL495Rwgq5pTxpggaWR4Kyh0bctH6OQcmcJP4kB+LI=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pwr2wtXcaVMQYjOzsTRWg2d2xfuVp2HnLmQJityZy5+JNyH730Z74fDDL+mEPrQDF/ddCqkVrTqvRJId5IA3pAVUeVeNnyTU6T3NqhPOfQNg35gi7mvaVic4tB/mLtpmiElJ7mZS0TE4NnRWUoNyJ/b/qXj35UF6VHu8MBI2KKo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bK7zucCE; arc=pass smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bK7zucCE"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-866e57f63a3so68405217b3.3
        for <linux-coco@lists.linux.dev>; Wed, 09 Sep 2026 07:52:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788965565; cv=none;
        d=google.com; s=arc-20260327;
        b=e65J4rqB8wgRe689g8ssRXGR+86jyk3+ByGoFJXS07/nlrBZaMX52U0WvNRspVfP/7
         vqDGkt9V4f7PRH1HTow4/02nje5T6zy0MCf4oTQuQLH/COn7PNWMvrDNvvpxCkqIe2/7
         /Hx1A+PwZHwe77g5ctQNMt2N/kflGbIFdMPkuYzCvhaMMoZRLUzHiTavSER4NEtL5IMN
         w1TCmMex6tp2RBkpWLuyXufoGra0jaLAc0sVwy/KHVHzRue+gDoV73FlnVCkwKqCQjab
         mlmOr9WERAnHDZ69UyQI8wRfWy9hqWdP0nkvhHSSoEmjDzq2+5eOkMGrsx92Dbthus76
         s3Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=QRvd1Tt7kpHM/AxQHBaJz2yfsVBadJLI9GFkxk7vpJA=;
        fh=/xBcK1K0dcjA8LHKyJpiZD6j/CEdqHQL9IvSTjn3i+Q=;
        b=rA8fbANBQLxJcrOIFjr+3oyU9r5j/EoMppBKnYuq1fRq6iId16ejAs+YTP69pDB7ZO
         +L0FTGtkE7nrqAfSTLAu9gKhlOYOWOkuAyKwNawSSthUVVPGDA2JQHNF4XZICJpFhw1H
         482gwM6R5atlerlIaLEn3ndvUqV7TGGtje+52WVIaq1Uczzt+Rp04YjO7GyzMCcAVe0s
         YWKgHMiLzEd5f/Uj5C/uEDlW+/lXQoDG1xGMp0vTPZuI9vTJMv9oPusSpyJQfFtd+Jn6
         fhkrrck4aDfcOg387l+CFKrbBByyJsj6Mb2rcq0odTyeIKnPhCdLN/jRRUwHshi2eRU2
         DgpA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788965565; x=1789570365; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QRvd1Tt7kpHM/AxQHBaJz2yfsVBadJLI9GFkxk7vpJA=;
        b=bK7zucCEuFicqUJhHaC7yEI9sNAH6SuIGbL0IeBL3E2cCSvEWjC8FnSq51MwmezZHI
         O+CY6UjkVXPCJ4xFpguQubaagFq3V2SarAMGXBmjl6NRBg6Xl2Ibt3RBh3pIpVQZGoyz
         0KmkUA/xOB7ogMuz+h9ARvDsM0IpuoTdMhdH0z1NeMXanupzw29NJLI74XFi46/75lhm
         aai/7op7vVN+zdd2bSQ9/x11lD87uQo5owGAQZKKif53cLdEyNPj9MHVAN8hYrougjG0
         6ouRegIiDBdmkkbIjD1KPkUymYyt8WryKVKgNZWeldW1hNor5Q+C9GHOwzt3u7sqCToV
         Hs4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788965565; x=1789570365;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QRvd1Tt7kpHM/AxQHBaJz2yfsVBadJLI9GFkxk7vpJA=;
        b=KV0bo+XBkQpxzj8+QTtfzomRZFowtKZmpUm1hFResYWZnZI77DHgdtBIGYfTYQcMqt
         qgYesmeslgp/iNeXYhO9E36o92ZH+DZJFhmMNJSIpz0e7q8ZRFxjmsVk7eal7SR8sdsN
         nNhPZQAkW5fQsDVKr1uVpzr8ILUEEo3QXkDPCl4o7ncfEf3JkN0vSNwD6z6dfn9Adgav
         ZZpv1GpvCfu9tc2XjGPbE4Y12ZfMFG0XOA7b2OQH+c0721lfT0tILPJ0j5SAEhWRdail
         wJbGUs55/8bEGEQ4Iu47nAVccRBcWZ0hdVPBvbZWG0kn0IZrZSQKSHQY2GwMN4W/XdHd
         O1Og==
X-Forwarded-Encrypted: i=1; AKwUvBx9Sa8ZEgCp4ZslNHMGjtkP0yM3YQcYHB6m0Khlkhjz0gjrctN6b4vAhY9917sqAMU2KYa7dw3j0Vv7@lists.linux.dev
X-Gm-Message-State: AFuF++n0XRL3szdlu4Ao6INpPn4wkIgD7Silr0dH85x3gHkgiRNkY11e
	EhRokmoCw+N6f31RH+X0uQbn7XxzJKXaUKubNnaraWhWBM6AOzPbEF0495ExsUDdKz6UWGo3fwf
	6At2714YYZyN2rg3oWzXm5LnOnYIC/NOF4bZ1WfWv
X-Gm-Gg: AYBFou2A0osS9O5yYy1fvg7WaXvRlAaoA8QP8gD9GLTfeTRnvIpZHlzJbhlKONT43d7
	tW20v9BNSnU6mtfNXsq/j5Lk/muiYFVFoR31XuZNhn5dCVwaBMCBy69DJjd3dvF+dprfWsTfdh8
	D6zrNbr62Z8+8ON92GIJ9ayRaD2gvDiGuTd4BqaLJfLh0uhSii3F3iIKoaZ3hXoqRR6LqFjcu5V
	SwwmUx/tv2QB3pMqTXQ8tkTH/83gBM5bLSh16rVjPpMHxToMskDrFxNhvPNAI2XG/zloi27597I
	6WR32FmL6hGgZqjr4Jwx+w2Z5fWvLAMo7qDUeCUpe7HY9GE4mWhQOgQA+v759JRIIYIFK8VOpbd
	ArlHpapgHzBk=
X-Received: by 2002:a05:690c:6b88:b0:845:ddf4:a3a7 with SMTP id
 00721157ae682-87126aa77dcmr145268997b3.16.1788965563207; Wed, 09 Sep 2026
 07:52:43 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 9 Sep 2026 07:52:42 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 9 Sep 2026 07:52:42 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <CA+EHjTyU1Ldbw-qqdQOx_P8jrt85QEcKSGae2h+AahsDQdbmLw@mail.gmail.com>
References: <20260830-gmem-inplace-conversion-v12-0-85e5fd25252a@google.com>
 <20260830-gmem-inplace-conversion-v12-14-85e5fd25252a@google.com> <CA+EHjTyU1Ldbw-qqdQOx_P8jrt85QEcKSGae2h+AahsDQdbmLw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Wed, 9 Sep 2026 07:52:42 -0700
X-Gm-Features: AcwNN1XhqWHW23-sQN5ajMsWY1WhBdcubAUAi4IgbeOekiJ8g-YJ7YTjJ4UYzFA
Message-ID: <CAEvNRgG36aXk8UW=Mi7ey-6vUe1EOKnkgNRNzdSUz-QJih4uAw@mail.gmail.com>
Subject: Re: [PATCH v12 14/45] KVM: guest_memfd: Add base support for KVM_SET_MEMORY_ATTRIBUTES2
To: Fuad Tabba <fuad.tabba@linux.dev>
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

Fuad Tabba <fuad.tabba@linux.dev> writes:

> Hi Ackerley,
>
> On Mon, 31 Aug 2026 at 01:25, Ackerley Tng via B4 Relay
> <devnull+ackerleytng.google.com@kernel.org> wrote:
>>
>> From: Ackerley Tng <ackerleytng@google.com>
> ...
>> +.. _KVM_SET_MEMORY_ATTRIBUTES2:
>> +
>> +4.145 KVM_SET_MEMORY_ATTRIBUTES2
>
> This section number collides with the existing 4.145 (KVM_PPC_GET_COMPAT_CAPS)
> below, so api.rst ends up with two 4.145 sections. One of them needs
> renumbering.
>
> ...

I'll add KVM_SET_MEMORY_ATTRIBUTES2 as 4.146 below
KVM_PPC_GET_COMPAT_CAPS. Thanks, good catch!

>>  4.145 KVM_PPC_GET_COMPAT_CAPS
>
> Cheers,
> /fuad
