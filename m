Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD143B058C;
	Mon, 10 Aug 2026 09:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786354518; cv=none; b=KtE3V4fKz8s+25tdXpxzDQd0W7EVVPSEuXKv5rdWaKIyngdAps96x4vTuW9PVzqCmW1Hutwhyl65RsNVPp42TkRrffDzW0N4y6z7dJQ42lzwTewgwCATO2ada98I8yCOukt+YP+p3ILngO5z4YGpjnN6vtfDeSHrg1ZXIPU1+e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786354518; c=relaxed/simple;
	bh=isdQD57jHgyTIBMiE4dTMqFI8UmNUWzlh68yHBIB5NU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=JzLiHZDSN6kpgzrOBAaMFbMauo6n8MWKvOLNb92nmNM/Aw83/54eXcAyPXzg6zh5dxl1SHz5s5a6+2iVTO0tXdp+qnJmI2Z4i/D3w+m6m/YdtVTLI125tpLMMVCvmjn+i9/IIAlm5G+F8MxqNZKBd31nA317gpAF5+Hz+6eqjgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PxxHfsMC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PxxHfsMC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74A541F000E9;
	Mon, 10 Aug 2026 09:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786354516;
	bh=isdQD57jHgyTIBMiE4dTMqFI8UmNUWzlh68yHBIB5NU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=PxxHfsMCqLn69dXi7Q0/a6J1VN4E06pelY/bq5MnIpTAIrUMbYQ5Kal2P8gowM4kg
	 o0PkCyUO1VdmJVmk2KCmrSeCIHECwptAOjDeuZGIfD9d0oL5CLrHP0knXiA7Gl34VE
	 88rZa367wzgb/WMhb6fn/5SgUPhnH9mycFWs9KyMDTEL8y2YZ0XrpoFsMk/y4+iQ2J
	 POUI21hFg1EKr8VXjWsXvpzUD7y3tEjJodbsWGODgxUrx2JqRpKrmo+ES29fzXgXv3
	 MRvwENCmYa3p4Ev5huNbaqJzNfMakFdDilbXItljAC/9sWKYEMZsQ1C8s5hBTFoeLj
	 AvjdizNpAnTuQ==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v9 0/7] Switch Arm SMCCC firmware services to an SMCCC bus
In-Reply-To: <yq5awlu43gg6.fsf@kernel.org>
References: <20260805063255.1638614-1-aneesh.kumar@kernel.org>
 <anMHs65s6Mk-ZRdT@arm.com> <yq5awlu43gg6.fsf@kernel.org>
Date: Mon, 10 Aug 2026 15:05:08 +0530
Message-ID: <yq5ase4miaib.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Aneesh Kumar K.V <aneesh.kumar@kernel.org> writes:

> Catalin Marinas <catalin.marinas@arm.com> writes:
>
>> On Wed, Aug 05, 2026 at 12:02:48PM +0530, Aneesh Kumar K.V (Arm) wrote:
>>> Changes from v8:
>>> https://lore.kernel.org/all/20260707081351.1680209-1-aneesh.kumar@kernel.org
>>> * Rebase onto the arm64 for-next/core branch.
>>
>> Was there a dependency on anything in for-next/core? We normally apply
>> series on their own branch on top of the vanilla kernel (e.g. 7.2-rc3)
>> and merge everything together in for-next/core. We (and many other
>> maintainers) strongly prefer series posted on top of an -rc kernel
>> (typically -rc1 to -rc3) unless there's a dependency on a different
>> branch. Never based on -next or -next like branches (which is what
>> for-next/core is, as the name implies).
>>
>
> The reason is that these two patches create conflicts. Since this series
> involves file movement, resolving those conflicts was not
> straightforward. Therefore, I rebased the series on top of both of the
> following commits:
>
> commit 24f55f511b9e ("virt: arm-cca-guest: use migrate_disable() for attestation token requests")
> commit e62decaf98e7 ("arm64/coco: Add pKVM as a CC platform")
>

Any chance of getting this picked up for the next merge window?

A few patch series depend on this patch:

1. The rest of the CCA DA series
2. LFA: https://lore.kernel.org/all/20260706134455.132091-1-andre.przywara@arm.com
3. Realm support for Hyper-V: https://lore.kernel.org/all/20260625173500.1995481-1-kameroncarr@linux.microsoft.com

-aneesh
