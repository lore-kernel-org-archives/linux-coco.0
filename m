Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.187
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794229949;
	b=GQ7e8qs2M65I/P2djKYmQtJSJlthDbejQaxO6oXge6MmYcUwxKKH1Q3fmYGiAjEHo6Cq
	 vnVjqGVtICtFthuEU2b1fb3rEZLaHhYmWV9iF4NH9VjGU0GYnCyHWDI6Xxqd0Rs/MLSZY
	 /K5ds1E1h4MGF3GLwBPVH07IfOdLD8EaVToAEzOf5eLl242+voDhem5fRA7WG1RByTLW1
	 H42kVKgraQBNZsvWhtQm9Y0erYL8jRkSWs8eDY/HrGPuAbmUJUqBNjzJHu4zPb7IIaubG
	 cAeQnPwFAHIMJlARA1yPYa/plif3QWXtBqRTGKosUvg8woI1yXR2f64lXiSzfTlNcpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794229949;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=VcGX3S/ok2ofcwS3uJdO8rQXnNkquiVnumUqc1g1VFE=;
	b=l+TNGTx99v3viykYA2w5AefixVzTaj+wScaX8LOpcLRXEbyuwl9Vj3dyJ1Fi4ZJlFo0V
	 OPW4ilPez2dSVuR05QK/OjEtJIiZiYx6liukX8GMd4qHOK4oQ/B+4Ezro9JBrNTANnp/G
	 WcXm5MtIWEH33y8JD7HnpRmmEbR13fK7PXpJM7vgGOMZm7LqMceX2bsdfhnv+56zpGl/F
	 7IzDzaSCO0LSQ9snEXnBqx6KK7FsEiatbMN0DHYS0LBABYy78Ho3W3tgMRH/Iqrfe74Xk
	 VLrrLoaL/bX1Dcx3ayDPPeHB5arLzETPEBSAYj5A9580fFbuuwSIy9jBOMCuxzBfG9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="bijr/jYb";
	arc=none smtp.remote-ip=91.218.175.187
Received: from mta0.migadu.com (out-187.mta0.migadu.com [91.218.175.187])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A31F606A326
	for <linux-coco@lists.linux.dev>; Mon,  9 Nov 2026 13:12:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A31F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=bijr/jYb
X-Envelope-To: linux-coco@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=9ZfmGyDfW24qGm7656Xt3E7F30kmlnVfQdHu0DS+Udo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794229946; v=1; x=1794834746;
 b=bijr/jYb/jTuZRJB/NT8VlbbP8qh0CWEk6AUL6Gl2KA1Wv4WOk3bZMu8rS/1VkJ/sBQrOaVw
 sCeeObva0UyxqdzFs42TaCDanZ/QEqGCZLZjW1vwiv8KITb76UQKBCpEnGFjkPY/ozcMJZE/DbZ
 uUlmZPwnfUxjrU7V9H/Op/9A=
X-Envelope-To: linux-coco@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 3d8ed4b859952828;
	Mon, 09 Nov 2026 13:12:26 +0000
X-Mizu-Trace-ID: 3d8ed4b859952828
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5c14bc5a743so5474e87.0
        for <linux-coco@lists.linux.dev>; Mon, 09 Nov 2026 05:12:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErG5FjgjtFUObfO6bW4eunpWMYvpFPK1Tnd5PUO6NOUv3bMlyhL0XYckp8LI2xhWXQdjqGDu6ZWnLXRu@lists.linux.dev
X-Gm-Message-State: APuU4Z/3bota9IojIGLvWvbpaowC7gbjYNjmSzqACG8QJsW/RLnTN7R2
	OvRS/C+pWQveJ6DbQZBiZ/nRAlQXki+Y/HKe8U6lSSFoStG532qSb3RNYCZoUK1ZtuNfME2mrrH
	AK17Z7QHJgQBUFf+TRY9+GFoBPvxT/w5m7yr3IIsu
X-Received: by 2002:a05:6512:1109:b0:5bf:c3e1:532b with SMTP id
 2adb3069b0e04-5c00b60a427mr195461e87.5.1794229945777; Mon, 09 Nov 2026
 05:12:25 -0800 (PST)
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261102141304.126883-1-steven.price@arm.com> <20261102141304.126883-11-steven.price@arm.com>
 <fa0ee5a1-4c49-4c1f-bfbb-c270dc4b6301@arm.com> <CA+EHjTy970AWnhYoZ5OqxQ8ojCAELeejw60y2NmpDsM_ZMdu4Q@mail.gmail.com>
 <06e52c9c-9026-4279-b8c0-53a54a667dad@arm.com>
In-Reply-To: <06e52c9c-9026-4279-b8c0-53a54a667dad@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 9 Nov 2026 13:11:49 +0000
X-Gmail-Original-Message-ID: <CA+EHjTzJ1O8=q0rL5CkLKN3CBDr=TkujEw_M-W0H=BJfmrTEzg@mail.gmail.com>
X-Gm-Features: AclHuK9lv_i4f5zskQj2LbWryVS8Q4D5sdKCijE4VdtfsoeeW5x-cT5K6pQCDgo
Message-ID: <CA+EHjTzJ1O8=q0rL5CkLKN3CBDr=TkujEw_M-W0H=BJfmrTEzg@mail.gmail.com>
Subject: Re: [PATCH 10/11] KVM: arm64: CCA: Support runtime faulting of memory
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, 
	James Morse <james.morse@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Zenghui Yu <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Christoffer Dall <christoffer.dall@arm.com>, 
	linux-coco@lists.linux.dev, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, Gavin Shan <gshan@redhat.com>, 
	Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun <alpergun@google.com>, 
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>, 
	Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Suzuki,

On Mon, 09 Nov 2026 11:35:31 +0000, Suzuki K Poulose
<suzuki.poulose@arm.com> wrote:
[...]
>> applies as is. Only how the expected state is computed differs: for a
>> pVM it comes from the per-page share state rather than an IPA bit.
>
> When you say, per-page, you mean per-IPA or per "backing page" ? i.e.,
> can pKVM do something like :
>
>     kvm_ipa_is_private(kvm, ipa) ?
>
> (similar to Realm) or does it need the struct page backing the "ipa" ?

Per IPA, so kvm_ipa_is_private(kvm, ipa) would work for pKVM too. A
pVM's page is private unless the guest has shared it, and that state
is in its stage-2 PTE at EL2, not in the struct page. The host kernel
doesn't have a copy today, since EL2 handles the share and unshare
hypercalls and the new state is only at EL2, so the pKVM side of the
check, a hypercall or a host-side mirror, is part of pKVM's
guest_memfd support when that lands.

Cheers,
/fuad
