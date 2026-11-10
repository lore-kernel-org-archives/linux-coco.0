Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.222.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794346785;
	b=q6RbOkKVBYSUUYDBWKUT8mxwa7XsPP61VDyuJFe9SLdTVlvS/XlI01H3hOJUZGPfZzVZ
	 b85iO41sbflSCdAlA75rLkaW7+uLRE88wp4C1Z1WmTrSI9HhcIQsuc9S8Z6OJniHm69LL
	 Q9DoZ4plHBp/uRkt0CPDUxTbOVhWqDoPvpcw+LnIUB2M1jb9IxoLAysDfSaS52RwUm35o
	 icT+MSJxgb/DoZoyNC9IT4LHw5x1Vt2kUyNq8xjclYh3prirogT/ysnr6KeAiIlmmSFSk
	 fHy3lYs5iAvlqnqg/aRy5O2Xn6v5p/TbsYMsYXNmEYZlLm0fuaz0Xlr8nIpcsXuxfZA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794346785;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:In-Reply-To:References:MIME-Version:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=iE/aw4N49+XkvXz5BpRtqkYQEcfxLRfryXdyEysnhdM=;
	b=rfrT1YjKmNEWhG8VhfbOsFzT3ytpU82+gn48JB2bDba+cb6YJXcP77DzNcZUZcONlYr2
	 k2Iiiii9fYomrVnahOx1BjXm4TLwZFpcK7HJqS9nFhODgJnalPjKTwHpOPBU5orOmg/QQ
	 2r29bKAKa7rZuhhLWvTZ0kCdfmmk4yQFnSc6Nch1NXhBcEwesLsFRzzemhv8ZP0mlXwb/
	 CDLBp3nYuvXJrDsNStVTAuD5knRvSh4gLc8wGjJKntVHOX5v/JoM0UX2ab62/X+HoRubH
	 SxlFkaAIqnE4QpWfkg+q04Bgo+wsbCK2DmMbfnqBqX7FNlV3HdR86hbSEe4ZHgPV1pg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HDDdqZBa;
	arc=fail smtp.remote-ip=209.85.222.181
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07DF0606A325
	for <linux-coco@lists.linux.dev>; Tue, 10 Nov 2026 21:39:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07DF0606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HDDdqZBa
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-9440304604aso267599685a.0
        for <linux-coco@lists.linux.dev>; Tue, 10 Nov 2026 13:39:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794346784; cv=none;
        d=google.com; s=arc-20260327;
        b=UNHY/+Qy4KgH8qrf0cDKTN2rae83aqOL4FFvRjcb+2VeIjhiTMsnWJB5TwvKbTRhTy
         r4MHINnCVSj8TbabUEl1a2moDTD/tyUJUB45gS0PvD4YiUJC+pKpIBHtxyk4dNnOVgmJ
         u6vXopAt9cHXIO8HTmHqwF05j2k+PR3vBeoFwC9WfMKeC0oHi2shGQvkwQsZQ7H2MBUB
         vsly9N5iob7qGLW+qOax/9TqL2RShWuEmq6kcG+6A7LyGiWfpn9B4/0YWT+b3KfItSyS
         6WaOiPGSt+Yy824Ui+hGEXrIC2opjEdN9z1Va0u78Wtcq9V/6SM2udfZOzbNzTDBLlNw
         L7Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=iE/aw4N49+XkvXz5BpRtqkYQEcfxLRfryXdyEysnhdM=;
        fh=LCbHpAMEP+arqUOxMGMYivpDN/7uz6afxyuUzD8iWj4=;
        b=srSgmyRWbVYcXpLIKH5606sU9zZzCrhro8E3Cy8NSCRnFsOf4f3zKukDlF1uk64buT
         7AlPtwX0xzlYkj7Sqh8p0+CJvx7go9wGOU/phiFOkglcPJJmAc+5ejNV5LvuG2WxUkbq
         EgeggMn6JSGcFcSR/q+K1vn351QvaxH6+wOOp5OQ71PB3rMQgCNo1NXrsoWH4YXT/TBJ
         Nx+kpvsb7rsYs0V9meH1TvPfIFc9dN/Vh4xgrpFBaFCF2kWffN7yWCHHKpmv6ICLLa1+
         rYaZFphk6FUDUpYr6D/D8hnK1C2a2VBYHeg+a1sjY8dkMqfSEXB3I7AomHNDPKLa+5h9
         6K4w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794346784; x=1794951584; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iE/aw4N49+XkvXz5BpRtqkYQEcfxLRfryXdyEysnhdM=;
        b=HDDdqZBaxHKb8y0leO5gvFOiNSi2oStSpezauLNyl0xQQmiBP7X+WTudtu3golIjxs
         MKEVUedsecY0+8EILIjKSfuuYeufkkPPw+v9B93s6M3WUIT/otXIzwBAclZE3+YLXBZK
         sakSuSPgED2rzmH+o+MWF65uhy7WVeeVsb8qIio917QrRb5rnO+zHaNH21sBbbVMApcV
         vK7knD6x3cc73FiwHOhkYXml/xyHVvb6Fc5Pr376xTlLCvVIr1jvH1svZBUS9CtCZv8O
         KsvFjhfEMKD1cVnMpoFNBYldw5Bz7anyCv9kRrYiutjFPlwWYpfjIEszgHZtk9ZJZh3K
         Ep/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794346784; x=1794951584;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iE/aw4N49+XkvXz5BpRtqkYQEcfxLRfryXdyEysnhdM=;
        b=rNjcj4h6MLfBy6+CiFT0W8rAwb45DA9PSowS2t2gHgWCm+rdO0mQ+YbO7scz7XmxsG
         jThibWoaVWSXtyUKYvrr+YEP2jssbdZVDTE21FZCIoHFYwwQ0a2BgjAYTu8+g/FMKYdN
         5eS0p4P3sRAW7odbZAdcilBgjFexOPcR3qQbPoh1e8szzfCp0qgfXZonTDODZRMqlhil
         HNfa7zZQCvRl/ipkJdIfSFn3wYnp9X37ZMVfiZan1ndD2M/HAnyudV+EynLNfWUZg3zY
         SIAYzQuAU6vZL8WkHSnJMVWOSE/fXoQj8LeIzEA+FeafJiuGMR0H9Qpifu47q852p+w+
         P81g==
X-Forwarded-Encrypted: i=1; AL+hErGJfGN5DL6Nhmj+2ewc1a5CT6E9MT9OT7BxUITzUb4rqnVB4D5Gy7cbUxZxnlG3yrJUuSvBSAmiQ0EN@lists.linux.dev
X-Gm-Message-State: APuU4Z+0EkTq373kQ/qwGQZS5HuMAmwfr6YVgTFHrcfgUEnN4Elma3J0
	YKMjMyzvTkFPkyNsR8sP5T7albdysQ9JedpZEkIZx4sDbFzkDWdlPvRVLmy8ZTMT/9Tw5MG+W01
	uHM/0LqSaTVjXbNPWfXZ1gf1E97AIIrQp1p3tWiUX
X-Gm-Gg: AYBFou2vmWmI4DqqErqMQkh/zAHar9G3jDxJ+8qWSGcbYr0oN+KBhzQaOO/r1ccRydt
	6d5UFYCC8y0qvT4wprT3bR3bwiSlQ7rpruKY8GO7q0DCu5WKxGlRjIFLDxZPHHjI5oPGSVzwvmk
	KSGgt9Deh/QKHp/oalkPXKZg5FMldLh79Dp7D5MzQKGKk98Na6f8CE3r0lOOavGNN5FFLTx1RAk
	xqQDAIWleM1NDXgfr9fS9Xj+ff3zg2aX/iAUSi/A/U1z03H+xSzQgiHE+aGgXuGaWwgbCg9gzgd
	xqCc9+0WNmQqVYG49+jx58DXUtddUmlmyIC4w7lZ2klRaZu1SdgeEmD+0uWtyZ+i/9PxExAoWTr
	jA8EbGLTGciORcNjuGRbAFHKGqIpE2VPtn//FKMT0G8hB9z+/y/r3l5fPnoId92O7woQN4Hppn5
	3xcZLnP+EU/qWGwsQlBEeU5zI=
X-Received: by 2002:a05:620a:6cc8:b0:93e:c12d:4ec7 with SMTP id
 af79cd13be357-947ae8caf53mr124925085a.39.1794346783277; Tue, 10 Nov 2026
 13:39:43 -0800 (PST)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 10 Nov 2026 13:39:41 -0800
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <avNpDjWxrgThIUXE@seanjc-mac.roam.internal>
References: <20261105-tdx-selftests-v16-0-2024e8fa517a@google.com>
 <20261105-tdx-selftests-v16-3-2024e8fa517a@google.com> <CAEvNRgHKQVLVza1dw9-OrDAt4-b6zbhx4T64D421sqb2MPWs0w@mail.gmail.com>
 <avNpDjWxrgThIUXE@seanjc-mac.roam.internal>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Date: Tue, 10 Nov 2026 13:39:41 -0800
X-Gm-Features: AclHuK_rifyMl6fGwEhJizkpiNdLB8JMLlwRf05wofhoaOCF7vOAUu20dn_gm7k
Message-ID: <CAEvNRgF+-12qeZQyrHb4Z8MWOjOGEYQj1hebnxs2gC9nY+M5RA@mail.gmail.com>
Subject: Re: [PATCH v16 03/20] KVM: selftests: Initialize the TDX VM
To: Sean Christopherson <seanjc@google.com>
Cc: Lisa Wang <wyihan@google.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Chao Gao <chao.gao@intel.com>, 
	Chenyi Qiang <chenyi.qiang@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Erdem Aktas <erdemaktas@google.com>, Ira Weiny <iweiny@kernel.org>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Kiryl Shutsemau <kas@kernel.org>, 
	linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	"Pratik R. Sampat" <pratikrajesh.sampat@amd.com>, Reinette Chatre <reinette.chatre@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Roger Wang <runanwang@google.com>, 
	Ryan Afranji <afranji@google.com>, Sagi Shahar <sagis@google.com>, Shuah Khan <shuah@kernel.org>, 
	Xiaoyao Li <xiaoyao.li@intel.com>, Oliver Upton <oupton@kernel.org>, 
	Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

Sean Christopherson <seanjc@google.com> writes:

> On Mon, Nov 09, 2026, Ackerley Tng wrote:
>> Lisa Wang <wyihan@google.com> writes:
>> > +static const struct kvm_tdx_capabilities *tdx_read_capabilities(struct kvm_vm *vm)
>> > +{
>> > +	static struct kvm_tdx_capabilities *tdx_cap;
>> > +	int nr_cpuid_configs = 4;
>> > +	int rc = -1;
>> > +	int i;
>> > +
>> > +	if (tdx_cap)
>> > +		return tdx_cap;
>> > +
>> > +	do {
>> > +		nr_cpuid_configs *= 2;
>> > +
>> > +		tdx_cap = realloc(tdx_cap, sizeof(*tdx_cap) +
>> > +					   (sizeof(struct kvm_cpuid_entry2) * nr_cpuid_configs));
>>
>> Would be nice if struct_size() could be used here instead of manual
>> calculation of the size. Same below.
>
> ...
>
>> > +void tdx_init_vm(struct kvm_vm *vm)
>> > +{
>> > +	struct kvm_tdx_init_vm *init_vm;
>> > +	const struct kvm_cpuid2 *tmp;
>> > +
>> > +	tmp = kvm_get_supported_cpuid();
>> > +
>> > +	init_vm = calloc(1, sizeof(*init_vm) +
>> > +			 sizeof(init_vm->cpuid.entries[0]) * tmp->nent);
>>
>> Would it be possible to use struct_size() here?
>> Or perhaps kvm_cpuid2_size(tmp->nent)?
>>
>> > +	TEST_ASSERT(init_vm, "init_vm allocation failed");
>> > +
>> > +	memcpy(&init_vm->cpuid, tmp, kvm_cpuid2_size(tmp->nent));
>> > +	init_vm->cpuid.padding = 0;
>> > +	tdx_filter_cpuid(vm, &init_vm->cpuid);
>>
>> How about something like this?
>>
>> 1. Query TDX capabilities first to get tdx_cap->cpuid.nent (let's say N).
>> 2. Allocate init_vm sized for at most N entries, since the filtered
>>    result can never exceed TDX's supported CPUID set.
>> 3. Iterate over the TDX CPUID capabilities, look each one up in
>>    kvm_get_supported_cpuid(), and append matching, masked entries
>>    directly into init_vm->cpuid.entries.
>>
>> This would avoid the memcpy and all the memmoves, though this works
>> as-is. Just an optimization/different perspective.
>
> At this point, I'll do minimial fixup when applying, e.g. if switching to
> struct_size() Just Works.  But I don't want to do anything more invasive at this
> point so that we can get TDX selftests landed asap.  To be clear, I'm not opposed
> to more cleanups, I just want to do them on top.

Good to know that this series is ready for Sean's apply + small
fixes. Don't worry about my suggestions on refactoring.

Sean, for this series, is the next step to wait for the merge to
kvm-x86/coco? Do you need anything else from us?
