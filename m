Received: from mta1.migadu.com (out-242.mta1.migadu.com [95.215.58.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C093793DC
	for <linux-coco@lists.linux.dev>; Thu,  8 Oct 2026 11:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.242
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791458300; cv=none; b=GdHNJF/eCdQNoIxTnmUojR+0bnIeXF0+7zl617z7k9GoiOe9PEmNyYU00FJUb9gY2RZLkGc/Mkfy/4RxzSTo70QEXTP6BX5mHHugG3W9nSimDieqnwtXElxUD8ZzhG9N7/BQLGJqm3l5+NpSsh2jEkYmnWS6PK5XsgE3SWGLa+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791458300; c=relaxed/simple;
	bh=RZDQiChJc4BLUjPTC5GATFlDtxZirW0FNEhzwWirWTc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UX9A2Qy7qWTyIHTEqsjQRjSrU+iFezMpqCTQmPBxOlxX8RvmelASJOEEEYghlyM5hMnkOOgk920JxSgeKYTIa1F+fUuIdwEkxmfz5YotGdHLGJOrgl/upsUVY7RHNLk7UikVz4kZ0TBgTkwaND4nuiSaF98NE2Yqdhk/srJKPoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=JaQ7FBK3; arc=none smtp.client-ip=95.215.58.242
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="JaQ7FBK3"
X-Envelope-To: linux-coco@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=RZDQiChJc4BLUjPTC5GATFlDtxZirW0FNEhzwWirWTc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791458295; v=1; x=1792063095;
 b=JaQ7FBK30MCcgF9LgfOlkKMJcNqIPGx+nTf+oPr3D7Vq1p4mN4ipmX4TSkfSVjRoB7zsUoTV
 WISUGTrs0l40TD5VScnWhl+j09lY8OwFUO6vuD5p1itfMlaGI87o/zLuJ6KLMYR4CFGLVHG9AhY
 O6rIgIR/Y5rOHm0RLVpn2qo8=
X-Envelope-To: linux-coco@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 832ead41f2858e02;
	Thu, 08 Oct 2026 11:18:15 +0000
X-Mizu-Trace-ID: 832ead41f2858e02
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5bcbb378fc9so7270e87.0
        for <linux-coco@lists.linux.dev>; Thu, 08 Oct 2026 04:18:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwdjIULUefcX8Ry2gHIuKuOFnEyWuTTpS/owNhJW7MS7a5IAowS+E1VXY+McUAoB9EHvItudQWdys8J@lists.linux.dev
X-Gm-Message-State: AFq9FYLcOMPOle9tFwVqIqXZTfSt3PIvGrOpCc40fsKlaGLyxN1QjTAi
	6fZimSCi498UigcWveSO2+Gmm8ym9q5huTR9WHob/YxdXVxYiqFihh4sstgwWIv6Z798ynfFPPm
	9/Swv4wL6p9yxbG0l4K3u9vGXZKV0X710xY0GF6Y8
X-Received: by 2002:a05:6512:2315:b0:5b8:cc2e:2fe6 with SMTP id
 2adb3069b0e04-5bcd41a3c42mr122649e87.5.1791458291477; Thu, 08 Oct 2026
 04:18:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261007073537.2454351-1-suzuki.poulose@arm.com>
 <20261007073537.2454351-14-suzuki.poulose@arm.com> <CA+EHjTy_1EekD472UH=CDSpC7oksdy3eS8AP0rPxKkhQ_PyXdg@mail.gmail.com>
 <4cdd882b-832f-4968-9838-dcc29a899121@arm.com>
In-Reply-To: <4cdd882b-832f-4968-9838-dcc29a899121@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 8 Oct 2026 13:17:34 +0200
X-Gmail-Original-Message-ID: <CA+EHjTyg7QM9+XtbQfAf77zpyNGh0rvEjMBm=mD0694Dtk=rGA@mail.gmail.com>
X-Gm-Features: AclHuK8P2lsNGbFWtbI77W6PCd57-smcbil7-006btPRzP0RGDfW9UFPgF16p5I
Message-ID: <CA+EHjTyg7QM9+XtbQfAf77zpyNGh0rvEjMBm=mD0694Dtk=rGA@mail.gmail.com>
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

On Thu, 08 Oct 2026 09:51:56 +0100, Suzuki K Poulose
<suzuki.poulose@arm.com> wrote:
[...]
> But the second part of the changes are required for pKVM today, right ?
> and you requested that here. The check as such is useful, except that
> it is using kvm_vm_hyp_is_distrusting() rather than
> is_protected_kvm_enabled(). I don't see this as a problem as this is
> not a hotpath anyway.

pKVM already gets the -ENODEV at KVM_CREATE_DEVICE: protected mode
never sets can_emulate_gicv2, so the check just above yours in
kvm_vgic_create() rejects a GICv2. The new check only changes
behaviour once a Realm can set the flavor, which is why I think it
belongs in the Realm series.

That said, my tag stands, and I don't have a strong preference.

Cheers,
/fuad
