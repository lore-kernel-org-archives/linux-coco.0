Received: from mta0.migadu.com (out-71.mta0.migadu.com [91.218.175.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4303CE48F
	for <linux-coco@lists.linux.dev>; Wed,  7 Oct 2026 13:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791380789; cv=none; b=auh+IK3rBEybcaKue4LJQJAnH5HOy1bShewMfC6cIhOQ5JzNkTFdgdLIUSXMAquOPPI3uO2Kex6T5Ks4SykMkcsDluOB/RcU+2STmBplEbCsc6/4qhrLq30IpvIk/SM5Unatq1KpMdOQHsDoCoX4/jrLZ0jUwfXsYml2m2c9jz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791380789; c=relaxed/simple;
	bh=EOLf8afyt5b6SOANC3rqCkf69jr4nV59FAjYhwNBzS4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F6PDWwuP7IkUoLiNXZcecqtutFJuCleWw5ls0+HX8UjI5xk6KXwaoHB8TgstCH/rgqmlMieRjSlpkMZqH53rhSBcU/csGMRksvbKdzEoSrVreZbFaCjQwvJeoBZ4KhrzbDJG5Bx7ie+JeJv+9DzK3iU/Q37O1cKtRMeLs7LfWLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=pMaIfFjL; arc=none smtp.client-ip=91.218.175.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="pMaIfFjL"
X-Envelope-To: linux-coco@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=EOLf8afyt5b6SOANC3rqCkf69jr4nV59FAjYhwNBzS4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791380777; v=1; x=1791985577;
 b=pMaIfFjLufpE3dLK3ghIVpudyLQIxDW6wRaz/lwJASUL87maSvpBCgLzbRNhDDhRyGD/T6bL
 QcEkuEFjf2BtXqEfLoeiO8qt2RQZfSoc8aPzT6xDgVPPv5Dglb4bLU/9WqsAgpzATyhF4t+2U6e
 uwwQo9K8v0baKZ9xmsmVL8Gs=
X-Envelope-To: linux-coco@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 173e07ade03ebd69;
	Wed, 07 Oct 2026 13:46:17 +0000
X-Mizu-Trace-ID: 173e07ade03ebd69
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5bcbb378fc9so9227e87.0
        for <linux-coco@lists.linux.dev>; Wed, 07 Oct 2026 06:46:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzM2EsY98LcRQ413tVQJoXQ1O5XBljP14sQQokIAxHxeJpC1CqERbaoJuicrH8eKjAdFHTtM6Z89wW/@lists.linux.dev
X-Gm-Message-State: AFq9FYLfE5wrpwlqoKCjN5qeClKXWwg5Ty07wq0HAJlRJV7oz1itbNRi
	KHe6J9sp06B3156NDGG1Lc3W8T7+xEeRWAjUxy4HwKrXN6YTEnSIIqejQvxvCgaK4GvVo+1uysm
	ntBywLjmJMNfYK6z2DGQZKjf/HEFBIE8InHeE3kac
X-Received: by 2002:a05:6512:a83:b0:5bc:b531:51ea with SMTP id
 2adb3069b0e04-5bcca86c249mr304368e87.13.1791380772866; Wed, 07 Oct 2026
 06:46:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261007073537.2454351-1-suzuki.poulose@arm.com> <20261007073537.2454351-14-suzuki.poulose@arm.com>
In-Reply-To: <20261007073537.2454351-14-suzuki.poulose@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 7 Oct 2026 15:45:36 +0200
X-Gmail-Original-Message-ID: <CA+EHjTy_1EekD472UH=CDSpC7oksdy3eS8AP0rPxKkhQ_PyXdg@mail.gmail.com>
X-Gm-Features: AclHuK_J8GmFTVM33wX7R0VP_JP-fZesKaU03j7TLtkYQU0t9fz-B9AOXRmoM04
Message-ID: <CA+EHjTy_1EekD472UH=CDSpC7oksdy3eS8AP0rPxKkhQ_PyXdg@mail.gmail.com>
Subject: Re: [PATCH v23 13/14] KVM: arm64: Mandate VGIC v3 for pKVM VMs and Realms
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

On Wed, 07 Oct 2026 08:35:36 +0100, Suzuki K Poulose
<suzuki.poulose@arm.com> wrote:
> pKVM does not trust the host. Realm VMs follow a similar trust model, with
> the Realm Management Monitor owning the protected state instead of the
> host. Add a helper to identify VMs that run under a host-distrusting
> hypervisor.

When I reviewed this in v21, the Realm patches that use this came
later in the same series. Without them, kvm_vm_hyp_is_distrusting() is
true exactly when is_protected_kvm_enabled() is, and protected mode
already doesn't register a GICv2, so this patch doesn't change
anything on its own. Should it move to the series that adds Realms?

Cheers,
/fuad
