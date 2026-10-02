Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3FF358375
	for <linux-coco@lists.linux.dev>; Fri,  2 Oct 2026 10:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790935654; cv=pass; b=pzubKMTxxPWBMY2xkFS4x99DYnzcejMtI8vEa0WUXyjwKIgAlJ7r1IYM+J4yo8nAPl7p+nX9V/Lqbb9n/PABD/zCzSQHhZ+4tvV8M0nwYT9ZQud2m9IZc/o/4vs2zPs1+pzv5XUIam8XIbxFA64TQS3fMBjSxLGPuMxT1BNf/Tc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790935654; c=relaxed/simple;
	bh=FFnxElmYnPjkgCx517QhWsk+SbV5hjMWuaYPOQlgkRE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MhuPBAC9bq5zC9pFZe3rN/xvqj3y/fOLe4zY8BQJUiHX6Nf1Hx7xqSwgwz5xFjNmwNz0aw8ItucLwctwmzSYCVn651DVKerE4WH1m34dmgrvN7HRXowgJuPl0H1w4FyYYtgXM73vbugyzh9iuY4kB30ird4Gnli4OsZRof9W+bw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Y6ZqGmkS; arc=pass smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Y6ZqGmkS"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5ba3d1ea20cso6124e87.0
        for <linux-coco@lists.linux.dev>; Fri, 02 Oct 2026 03:07:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790935649; cv=none;
        d=google.com; s=arc-20260327;
        b=YKOSdDOhpL5vawq+iyX+DQaknOqkOziNVZH0C+iNgGROPYBUbgJjGuqtNWPrIZDarb
         OS9g7Wn+M/E81cOtF/YGYoTi4DcXrmruhhcfzCEbk0fo46t5Nq4Ls/9bPXABlxJ1M7V4
         Dlb+uN7pv7Cd9HaVFkD7DkVU7DWRbYwskmEeFbGsWQiwcybOSwQ4FG4ckpTg+Yt86Jyx
         SJumNg4XE9IdufOG5s6xYYsRKZTxAwuEr/nIwvOo3JosX1Wr+WWqWGaMWofI1nx8lDSh
         VM0BE9Jwc49/4uhg0+nbcBcSJUHnmvepTUwScMGKBgcPV5oXHW0yR6EvuXGyQJ07nb9b
         IDGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=W2aHjvSPxe+vAP9qLitaZl/l2SuTqD1rpV9O3EUjP1g=;
        fh=3VDPKE+TK2kXd4RGhRIUONPPhgtb7BuCM3j9afNui5A=;
        b=qQbzWUzA6Sn1DjgjyN3TBAn93AO5BEtRExIRa8H0+3eNzp0FZa2EdDCdpx+eqfnNta
         8+3kUHFOPq36CP0iehX2AWquLHBknIutRMOAa9fsjMmj0li2WdOaAiyJNSJf+GZFtDbC
         IiwEM0zyRbzBmAp58d9Oqmb/yAs6JUMw8FH4f5NM52M4FoLccXwboS5bHNpHYB/Mh+Ul
         gy+0rH5lC+Ni3hgXZe2nWPDzkwAN3mBAbhAJiUVZbZIXyZfUrmM8Yg2hxXA+uvB85ZL0
         8iEMYQRtXDuJ+l8GRDqqy0cl0LZcU5lVLdWwxEKj8liy49X0TBAFA8LFh2obA7pu4v+J
         MhvA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790935649; x=1791540449; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W2aHjvSPxe+vAP9qLitaZl/l2SuTqD1rpV9O3EUjP1g=;
        b=Y6ZqGmkSap3dNZe2VT4qYXYGBtB07/0NVZ6YtbUKON7DvXc6ZxmeJItyxtViej8kAi
         jM7iKckBC0+OZz67QQK4iMmzjURvI4L4tybj2zsqbcu0WLa1oU3uMrh+3WMGvlxdqZqY
         xg3BXoUsrgQInVw/5lhcKYMlTXCVuDXJIYZmKuIiB5JwMaSCrqyNJEOK9Xe/2As7REQn
         BzLI1T6cXrgVrInReKrdkCAKY1pTdGFaXQB/RgBis8COh9pWABzB421ONsA+4lxA4Jkg
         1uK19J5Qd4+U2fc2T3u741JlZ1tVAg9B362dhPAU+c6xByFGl7u5WFcnQc6CDcecaAiv
         XiQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790935649; x=1791540449;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=W2aHjvSPxe+vAP9qLitaZl/l2SuTqD1rpV9O3EUjP1g=;
        b=kzshziM7QW1TaW1ralgmk4UAHo/0RfCvFQ7UE9UIfgEdkPinqh1ueNhu2nUgzLHwCJ
         g72RfWWaYawTQTV4r2vtkQVMPu7T5ya2ImG4URNkxXKU7Oogkc/Tb1E+xFJDKwDQM09H
         RNFIP4Lhwzf7HTOm4lmh5z+dGcUBAOLVsJRbwdfC+gFDIicbaN3UsGB6rtB4UlogU8L0
         bli3NxkLqgiRX6ZTQEY/vp47J560dCkXjHXuAEAWyR7T0FKTtvuOPWHpz1AA+OrJZ2Mw
         zsVpo/loh8Gl8z/lxiFiDT09t661acX9K6W5DaQGuWoFuD9WGMMR0PkEmZkRuX5reMc+
         5pqg==
X-Forwarded-Encrypted: i=1; AKwUvBxCKPLeEgo+EHGiRuDw1j3V2gPlJXbkfYVK4BztEMax/NpXPcPH3/hXS0YMc//egnPc59AVB7kyDbAA@lists.linux.dev
X-Gm-Message-State: AFq9FYIiq0uNvfeTFEaGXlMBIr3WomXHhpOzofOFo0npv4r10G4vv5TZ
	5HRhIlgNibUhgGaNlQt4/8n9FU2ePaRBJ0q0T2KcTZZZh5f3VdmNpS1b9rOwf30ITWAoB6JbHLx
	7P5nDWE2djgTfgoSGtZKhxSPxDK9GxgKWFJ95CGdR
X-Gm-Gg: AYBFou2DRQERsmNq0S+Ds9SzRGyIMwoEmOpxC105bNm1+bCFJVkFVlnlLka19Yjp1Qk
	JfEukbGiujm8kMO4FWklmTUyDxaIU1TMMbzXKfm81jtKspwKrQUXur7UedeU/wWj4d3cJQn7Sut
	yfCa6pl+wgj4DbLh1EibpGwGhRd6hapr5behL8wXC/j5AABxf81fAt7IxUSN/UuL+/7XKOEH/N2
	rUFtQieEyNpiqN0eFulXTeRUWXC7+uHoj3HFlMFYqZyhl5hkdvLXzkEtTeq2F0JpK+vm8PYgT7q
	N6pzHTpj1gyJoqrtxnT5v67ypO1BviH8cAEMZdTFEsW5OxCsn/bjCZHE09iHTWVmsv0QFKV+uH3
	xZIt+Of3oFB4WJA==
X-Received: by 2002:a05:6512:3b26:b0:5b8:d04b:a1be with SMTP id
 2adb3069b0e04-5bb7c91a8a0mr135912e87.2.1790935648531; Fri, 02 Oct 2026
 03:07:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261001210703.1597150-1-suzuki.poulose@arm.com> <20261001210703.1597150-6-suzuki.poulose@arm.com>
In-Reply-To: <20261001210703.1597150-6-suzuki.poulose@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 2 Oct 2026 11:06:52 +0100
X-Gm-Features: AclHuK9UDCM_CxoGcsAnKo4MTwuWCAngd_IrvUFvtXNGuqDBjBBZg_tfUnO_TY0
Message-ID: <CA+EHjTxtatPyGcyvEyR129cqUiAYcO_cxRVtwZO0ckZsOnD7TA@mail.gmail.com>
Subject: Re: [PATCH v21 05/23] KVM: arm64: Track the type of VM in kvm_arch
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org, 
	will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, steven.price@arm.com, 
	aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com, 
	joey.gouly@arm.com, yuzenghui@huawei.com, linux-coco@lists.linux.dev, 
	gankulkarni@os.amperecomputing.com, sdonthineni@nvidia.com, 
	alpergun@google.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com, 
	lpieralisi@kernel.org, enju.kohei@fujitsu.com, sudeep.holla@arm.com, 
	jonathan.cameron@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"

Hi Suzuki,

On Thu, 01 Oct 2026 22:06:45 +0100, Suzuki K Poulose
<suzuki.poulose@arm.com> wrote:
[...]
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
[...]
> +#define vcpu_is_protected(vcpu)                                                \
[...]
> +                        if (is_nvhe_hyp_code() &&                        \
> +                            !is_protected_kvm_enabled())                 \
> +                                __kvm = kern_hyp_va(__kvm);                 \

On a non-pKVM nVHE host, the hyp callers of this in switch.c and
timer-sr.c now translate vcpu->kvm and load vm_flavor on every guest
entry and exit, where the is_protected_kvm_enabled() check used to
short-circuit. Could they use vcpu_is_protected_pkvm(), and drop the
kern_hyp_va() here?

With that:
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad
