Received: from mta1.migadu.com (out-167.mta1.migadu.com [95.215.58.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054053B05BC
	for <linux-coco@lists.linux.dev>; Wed,  7 Oct 2026 11:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791370882; cv=none; b=sN3xX5UdD0k0E738xG4gYTovQu6OkpdDDfyJl33/Ig13AZ8Ye+syqtblyTdPdOv8E0ukqNHkgwFM/fWsdxs+tx9KdU5xGFagoPf8KMmmYnpPwI34Cd3ufHnJcTOtqiZUgwryB+zlOHoQf+bfPaH6oUZRfsxCebhnmZe7bFP0xW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791370882; c=relaxed/simple;
	bh=7AAmUdrhI1yAcj5z7olkLM57zlwGodlaq9p9uBBFRNA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i2aSNz4onJ/NXVkXqAUkgxAS9nlcoauZb0uB0YVvd+B1vxb88sNahCE1+P2gQrlwIW3Fp3B1vqjZmcOrSOWN96nhr5EUJVVwEJ2HsRV0h3Eoc0C+zPGUxEsXmtpt1kMfHkwPJF6bvSrzAxacQ3aLkWNPdlYpjulhTW9kkJlq31Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=tn363HVf; arc=none smtp.client-ip=95.215.58.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="tn363HVf"
X-Envelope-To: linux-coco@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=7AAmUdrhI1yAcj5z7olkLM57zlwGodlaq9p9uBBFRNA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791370848; v=1; x=1791975648;
 b=tn363HVfaG1BSxJl7FV6GnV7WwNpFDJSPXHo7wm6x7nfvX0XrZZgHjBkMRsM2ujO8ZnRwKqO
 INGuFC8pHfVDf9Ot8yzQFf0Jiss1xbgRsBESwJCiKiMKl2mRh4uMGw4uZso5K+iGptmRqcK/5Dt
 0MksrX7iqYl+y2g4pIJ96Gtg=
X-Envelope-To: linux-coco@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id d9b38a786707b92e;
	Wed, 07 Oct 2026 11:00:48 +0000
X-Mizu-Trace-ID: d9b38a786707b92e
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5bcbb378fc9so7893e87.0
        for <linux-coco@lists.linux.dev>; Wed, 07 Oct 2026 04:00:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwc3H2ax8nMPf1NN6oeN4FTJ6owlLOHqzF4zPVd8LR75RSk4sM/h30NrItT7nUx/nqEcRsmYqm2LUzG@lists.linux.dev
X-Gm-Message-State: AFq9FYJ4Hv4WyjDktiS8rd+Yp4QiuwSZoTlRU/Xoc9NzdCkTh0GE2N7j
	QW4EB63gqFYuN7ehcfC6nKHRZTfMvWUB2eAWGaKbRebT5J70uvNLG3Ep7WFezON9Pns+sVl/62O
	MtDJ+y4uE7MEfwFIG/lExQR7mn5c0icijICrH1gWQ
X-Received: by 2002:a05:6512:10c4:b0:5bb:7b34:8e00 with SMTP id
 2adb3069b0e04-5bcca834338mr303502e87.6.1791370843101; Wed, 07 Oct 2026
 04:00:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261007073537.2454351-1-suzuki.poulose@arm.com> <20261007073537.2454351-4-suzuki.poulose@arm.com>
In-Reply-To: <20261007073537.2454351-4-suzuki.poulose@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 7 Oct 2026 13:00:06 +0200
X-Gmail-Original-Message-ID: <CA+EHjTwdoj8k8-To5ywwDO18Ek-sET5OHbKuawatTNvMc6gyGQ@mail.gmail.com>
X-Gm-Features: AclHuK9kFsM0C-8314xeyKxj7wNCXh1xIF58U3OrNPCRgmPj5uaBmkaoPd_Q9sw
Message-ID: <CA+EHjTwdoj8k8-To5ywwDO18Ek-sET5OHbKuawatTNvMc6gyGQ@mail.gmail.com>
Subject: Re: [PATCH v23 03/14] KVM: arm64: Include kvm_emulate.h in kvm/arm_psci.h
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
Content-Transfer-Encoding: quoted-printable

On Wed, 7 Oct 2026 at 09:36, Suzuki K Poulose <suzuki.poulose@arm.com> wrot=
e:
>
> Fix a potential build error (like below, when asm/kvm_emulate.h gets
> included after the kvm/arm_psci.h) by including the missing header file
> in kvm/arm_psci.h:
>
> ./include/kvm/arm_psci.h: In function =E2=80=98kvm_psci_version=E2=80=99:
> ./include/kvm/arm_psci.h:29:13: error: implicit declaration of function
>    =E2=80=98vcpu_has_feature=E2=80=99; did you mean =E2=80=98cpu_have_fea=
ture=E2=80=99? [-Werror=3Dimplicit-function-declaration]
>    29 |         if (vcpu_has_feature(vcpu, KVM_ARM_VCPU_PSCI_0_2)) {
>                  |             ^~~~~~~~~~~~~~~~
>                                |             cpu_have_feature
>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> Tested-by: Gavin Shan <gshan@redhat.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>

nit: If you respin, could you update the commit message?
vcpu_has_feature() is in asm/kvm_host.h, which arm_psci.h already gets
through linux/kvm_host.h, so this error can't happen. What arm_psci.h
uses from asm/kvm_emulate.h is vcpu_get_reg() and vcpu_set_reg(), in
kvm_psci_narrow_to_32bit(). (Sashiko, confirmed)

Cheers,
/fuad


/fuad
