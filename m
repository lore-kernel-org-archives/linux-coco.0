Received: from mta0.migadu.com (out-19.mta0.migadu.com [91.218.175.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 191523C10BE
	for <linux-coco@lists.linux.dev>; Wed,  7 Oct 2026 10:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791370372; cv=none; b=ADuD8kLdEgMBhSAL78kRINBF76RCZzYM56nxs58LDQLK4j4Ytfb6V05odOA92JxpUWcUOowDCh392GTJ7LYzOD2oGocDzYautNtkQIGIsgx9uDEvrDwIzbvmC0/RfycY0awIDgPrsaeLUYeuyapwA6qXYFlBjTQGo/2jFFE4CJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791370372; c=relaxed/simple;
	bh=IYj7GJMoI4iyh7cvdiMZ7m7A/3iJ5WzI14Ui9Zh8zRE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u/RvOwLJMtHZgwfzW92Rc2VzHmy/TOn/pEDYk86wah4d76RPswHvzC55YbvRg1OgSP8fYQZGJmIMcu6/a69c112rtFc3G329ie7p7Em11DB89exhtWC+vf+f/8ZkiEHq0w9tXDUoKWqAK4J2F25F69DeFsd8DnI+SxWynhXQe8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=bxJvoH6P; arc=none smtp.client-ip=91.218.175.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="bxJvoH6P"
X-Envelope-To: linux-coco@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=IYj7GJMoI4iyh7cvdiMZ7m7A/3iJ5WzI14Ui9Zh8zRE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791370338; v=1; x=1791975138;
 b=bxJvoH6PfwIxmbe4AAyizT2QtYXAHMiTpml5mpjVl73063aMQVWZ6pFFsuEuDALnAKyL0kh/
 P4rgRNAwVdoPB99vHCk3Hz2x4zMVD+ePctRRWRGv8C8D0GUjdT5rv+nbDwr41MZXx0XqK5Bekps
 XbgFsqbW54Usc7pP+Uuuj/Kc=
X-Envelope-To: linux-coco@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id ee2906b7852a0fd9;
	Wed, 07 Oct 2026 10:52:18 +0000
X-Mizu-Trace-ID: ee2906b7852a0fd9
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5bcc04c71f5so7428e87.0
        for <linux-coco@lists.linux.dev>; Wed, 07 Oct 2026 03:52:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwUtlnDc867VSl6X1Xtu1/L+9Eby/DXsF56kzcVmSCeIuvpsEoOjTnfEAzY0pZ4x/3vXHGNVccGI2tW@lists.linux.dev
X-Gm-Message-State: AFq9FYLdIGpejnLByXFWFNE0ishmwrI0/brfdWqmjp6y29WTW+JONd9u
	rBuVVencMrA/W4VSUs/HvVfscUrx6sQ1RBh0Rj3u7kJTa0RXm69DzmRGDBGxYEnSuHfV/PlSRKh
	IyMHhJQDJXuI4aNd+kQMsBs1oRIC371P86ty/cLzj
X-Received: by 2002:a05:6512:a89:b0:5b8:f20b:350c with SMTP id
 2adb3069b0e04-5bcca123ca8mr312158e87.3.1791370334717; Wed, 07 Oct 2026
 03:52:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261007073537.2454351-1-suzuki.poulose@arm.com> <20261007073537.2454351-3-suzuki.poulose@arm.com>
In-Reply-To: <20261007073537.2454351-3-suzuki.poulose@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 7 Oct 2026 12:51:38 +0200
X-Gmail-Original-Message-ID: <CA+EHjTyb3-QoLa6P-dGXVdMh9E_vO3p8HceH3TH8h8gPJSd1Kw@mail.gmail.com>
X-Gm-Features: AclHuK9KvLpSDQrj6i2mZweuyXItR2scaGR6GbHNtuuSCxJB5qE1qI3r7GdrQYA
Message-ID: <CA+EHjTyb3-QoLa6P-dGXVdMh9E_vO3p8HceH3TH8h8gPJSd1Kw@mail.gmail.com>
Subject: Re: [PATCH v23 02/14] KVM: arm64: Disable Steal time accounting for
 protected guests
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

On Wed, 7 Oct 2026 at 09:35, Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
>
> PVTIME support is advertised by KVM_CAP_STEAL_TIME, which doesn't take into
> account the kvm instance. Even with that, a VMM could skip the CAP check
> and proceed to configure the PVTIME as we don't do further check on the
> DEVICE_CTRL. Tighten this up by passing the KVM instance around wherever
> possible and catch things early.
>
> Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Gavin Shan <gshan@redhat.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Someone beat you to it. This is already in kvmarm/next as a5b0f36a045e :)

Cheers,
/fuad
