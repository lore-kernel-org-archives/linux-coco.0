Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4E1409131;
	Thu,  4 Jun 2026 12:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780577943; cv=none; b=fBPNfsxjMo9MXpnIncNqe8dFlokT5Y0OkSLoNy9dfCQ7biVEfKTcOrb68a2mrczvWA4SIxiHdArYrbgcsbSDh10Z1rz40x68RkgLWr73/+1UJ96KGPNE6B255xTsiMgT8Im386J+10xOcJ22mD398QzqQsg4TbtqonECMbX4rRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780577943; c=relaxed/simple;
	bh=ns6EOiv/DbO2oyNf7BQsADHvEVxuPqFiM2RPQ8DKZeY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=iVLAOxYfUZTrHOyimBAVNIOpFAcm4Q0UAQRrjY3/17SmYApWc8NYQByO5Y8k1osHkRPYWHKGTCMrhc/oEviwivDxeAvvB1UJYD8vmaWO9PFwvyxOz5w46b5v4phZ36bl7xGdhtlHUvSCy7a5tTI63QTHzRIUwnvo0EKQ1St+7Ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BEbFpXyb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BEbFpXyb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F6231F00893;
	Thu,  4 Jun 2026 12:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780577942;
	bh=ns6EOiv/DbO2oyNf7BQsADHvEVxuPqFiM2RPQ8DKZeY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=BEbFpXybcDnZt90rF1wHgq0+lDe5SGsffyAP9HouNZYlR/6fmN9ghOtswpIcmXhlQ
	 GeTq8s/B32fY8atHayl/nczGINGnHSlBiSHTSZc0y6DjJZirhd5lJDUF4NjmSVvjPv
	 /NvOUHqxu3cPrJLAzXoyk3Gm9c/4fj+ag7FZanFRg0KWZzp6aH8wYpDno/I7efHozt
	 J/12RRLCaSuupTwxWP0eNNYFBJuaoioRwgGnZEpqtL5e4SxHL147nwFiv3qvZ2yJ1/
	 oTw0Zkk4uzvAcHeAL2N1BOnomgYVfWL4ZpcTFC/n7ZXV0zk8zS04q5wRRIY6rCt4PW
	 NnNML3iCU7Tag==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: gregkh@linuxfounation.org, linux-coco@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>
Subject: Re: [PATCH v6 0/4] Switch Arm SMCCC firmware services to an SMCCC bus
In-Reply-To: <20260527100233.428018-1-aneesh.kumar@kernel.org>
References: <20260527100233.428018-1-aneesh.kumar@kernel.org>
Date: Thu, 04 Jun 2026 18:28:54 +0530
Message-ID: <yq5av7byqx69.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain


Hi Greg,

"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org> writes:

> As discussed here:
> https://lore.kernel.org/all/20250728135216.48084-12-aneesh.kumar@kernel.org
>
> The earlier CCA guest support used an arm-cca-dev platform device as a pure
> software anchor for the TSM class device. That platform device did not
> correspond to a DT/ACPI described device, MMIO range, interrupt, or other
> platform resource; it existed only to make the CCA guest driver bind and to
> place the resulting TSM device in the driver model. The same pattern also
> exists for smccc_trng. Creating separate platform devices for such
> SMCCC-discovered features is misleading, because those features are not
> independent platform devices.
>
> This series adds an Arm SMCCC bus for services discovered through the SMCCC
> firmware interface. The bus provides SMCCC device and driver registration
> helpers, name-based matching, uevent modalias generation, and a sysfs modalias
> attribute. SMCCC service drivers can use MODULE_DEVICE_TABLE(arm_smccc, ...)
> to emit arm_smccc:<name> aliases, allowing userspace to autoload service
> drivers when the SMCCC core registers matching firmware-service devices.
>
> The series then moves SMCCC TRNG and the Arm CCA guest RSI service off the
> platform bus. When the SMCCC core discovers the corresponding firmware
> service, it registers an arm-smccc device for that service. The hwrng
> arm_smccc_trng driver and the Arm CCA guest TSM provider are converted to
> SMCCC drivers that bind to those discovered devices.
>
> The old arm-cca-dev platform device has also been used by userspace as a Realm
> guest indicator. Removing it without a replacement would leave userspace
> depending on an internal driver-binding device. This series therefore adds
> /sys/firmware/cca/realm_guest as a stable, architecture-provided ABI for
> detecting whether the kernel is running as an Arm CCA Realm guest, and then
> removes the dummy arm-cca-dev platform-device registration.
>


Gentle ping. Based on your feedback in [1], I reworked the series to use
an SMCCC bus, with smccc-trng and arm-cca-dev represented as devices on
that bus. Could you let me know whether this approach addresses your
concerns?

[1] https://lore.kernel.org/all/2026051451-comfort-museum-4d2a@gregkh/

-aneesh
