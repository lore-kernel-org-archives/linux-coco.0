Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050363DE445;
	Mon, 18 May 2026 06:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779085792; cv=none; b=CZ6dNG0RmfAlB3kh3TTWvzjzZQNUO1ZDgk0HKYduC/1uPVNrwp+/DrsoBv7HFEHt6FdbG3SROHyUdJk9uQmv3/ep/Flbo8fuVvTyv4xkWApajmJgDxEWVf3C5TNoTWxqzWhBsdGET61Ly5C5M32rGguqLbvZTaZENkOUSAZM8/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779085792; c=relaxed/simple;
	bh=Xh7w7wEfnab0GSYumOL+HvLpnmXotMfZwX7VhW4Nuss=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=GDnkO+x4Nj1itX/KKW1fDe7vdGI0UEuTewTZuJazV/3GsNLpt6COcD+BXNXfTFwf0Vg+unTXI0IFWwYj8G6uqxPaU9PtLBnN3YXNUphbOJZkpZBd4ydVV171pwMA9J4emNmz7pzu1lMweHBCnQw3dV2PPsKUnSdRj4bE51QuKMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ibRAIZYL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ibRAIZYL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0539C2BCB7;
	Mon, 18 May 2026 06:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779085791;
	bh=Xh7w7wEfnab0GSYumOL+HvLpnmXotMfZwX7VhW4Nuss=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ibRAIZYL7cOQIV/4eXb2SMHBrA5p7RnZxRWlJteC0IhBbtN0mb/NDl7sHmAef4GSa
	 PVKk2KXoXKtEO+7IXGD8zHC2bPv4iGjToZxzNuluROioo59UkulmZHG7SGdKItdmQd
	 T3QqDDa4fFoig4sRbRJEMB5qzTaf+N5JKJDz52X3MZ5XzUljQ736xvJndJ6C0LxvNk
	 +v7ZyWGdNX6C4ubg7uzRJVbS+tFILbbh5Zst5yXI+u80nXkOxh6Twi+08X5iYjyKsn
	 Br3FpoTGpi7FlSbx2s4WDPFxB6khvIH0ZBWpCRivagfna7NnLDDi5zm3fD/aCglm2B
	 nemHdyCUoQVdw==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v5 1/3] firmware: smccc: coco: Manage arm-smccc platform
 device and CCA auxiliary drivers
In-Reply-To: <2026051404-headboard-cabbage-e09a@gregkh>
References: <20260514094030.42495-1-aneesh.kumar@kernel.org>
 <20260514094030.42495-2-aneesh.kumar@kernel.org>
 <0c88bcee-65b5-4328-87e6-e1c714c3d1ca@arm.com>
 <2026051420-amusement-drove-73e6@gregkh> <yq5alddm5a6w.fsf@kernel.org>
 <2026051404-headboard-cabbage-e09a@gregkh>
Date: Mon, 18 May 2026 11:59:44 +0530
Message-ID: <yq5apl2txmav.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Greg KH <gregkh@linuxfoundation.org> writes:

> On Thu, May 14, 2026 at 08:07:27PM +0530, Aneesh Kumar K.V wrote:
>> Greg KH <gregkh@linuxfoundation.org> writes:
>> 
>> > On Thu, May 14, 2026 at 12:04:13PM +0100, Suzuki K Poulose wrote:
>> >> Hi Aneesh
>> >> 
>> >> On 14/05/2026 10:40, Aneesh Kumar K.V (Arm) wrote:
>> >> > Make the SMCCC driver responsible for registering the arm-smccc platform
>> >> > device and after confirming the relevant SMCCC function IDs, create
>> >> > the arm_cca_guest auxiliary device.
>> >> > 
>> >> 
>> >> There are a few changes squashed in to this patch. Please could we
>> >> split the patch in the following order ?
>> >> 
>> >> 1. Add platform device for arm-smccc
>> >
>> > Do not make any more "fake" platform devices please.
>> >
>> >> 2. Move TRNG to Auxilliary Device - (Even though it is a later patch, move
>> >> it before the RSI changes)
>> >
>> > No, move it to the faux api please.
>> >
>> 
>> 
>> Maybe I was not complete in my previous reply. I did not want to repeat
>> the entire thread, so I quoted the lore link for more details.
>> 
>> 1. We have platform firmware-provided SMCCC interfaces. Based on the
>> support/availability of these function IDs, we want to load multiple
>> drivers.
>> 2. This patch series adds a platform device to represent the
>> firmware-provided SMCCC resource.
>> 3. Different SMCCC ranges are now represented as auxiliary devices.
>> 4. Different subsystems, such as TSM, can autoload their backend drivers
>> based on the availability of these SMCCC ranges, which are now
>> represented as auxiliary devices.
>> 
>> You had agreed to all of this in the previous discussion here:
>> https://lore.kernel.org/all/2025101516-handbook-hyphen-62ec@gregkh
>
> Then why did someone say "this is a fake platform device with no actual
> resources"?  That's what I was triggering off of.
>
> Again, if you have actual platform resources, GREAT, use a platform
> device and aux.  If you do not, then do NOT use a platform device.
>
> totally confused,
>
> greg k-h

I have now rewritten the cover letter as below. Let me know if this
helps.

Switch Arm SMCCC firmware services to auxiliary devices

As discussed here:
https://lore.kernel.org/all/20250728135216.48084-12-aneesh.kumar@kernel.org

The earlier CCA guest support used an arm-cca-dev platform device as a pure
software anchor for the TSM class device. That platform device did not
correspond to a DT/ACPI described device, MMIO range, interrupt, or other
platform resource; it existed only to make the CCA guest driver bind and to
place the resulting TSM device in the driver model. The same pattern also
exists for smccc_trng. Creating separate platform devices for such
SMCCC-discovered features is misleading, because those features are not
independent platform devices.

This series changes the model so that there is a single arm-smccc platform
device representing the SMCCC firmware interface itself. The firmware
interface, including its discoverable SMCCC function space, is the
resource: after PSCI/SMCCC conduit discovery, the kernel can query SMCCC
function IDs and determine whether optional firmware services are present.
Services such as SMCCC TRNG and Realm Services Interface (RSI) are
therefore represented as children of the arm-smccc device, and are created
only when the required SMCCC function IDs and ABI checks succeed.

The child devices use the auxiliary bus deliberately: they are intended to
bind independent feature drivers, not just to provide a driverless object for
sysfs or other class-device anchoring. They are firmware-provided functions
of the parent SMCCC interface that are consumed by separate kernel drivers
in different subsystems, such as hwrng and virt/coco/TSM. Those drivers
need normal driver-core matching, probe/remove lifetime, and module
autoloading based on the discovered firmware feature. The auxiliary bus
provides a MODALIAS and id-table based binding model for that case, while
keeping the feature drivers off the platform bus. A faux device was
considered, but not used because it is suited for simple software objects
that do not need independent bus/driver binding. The faux bus has no
feature-driver id-table or MODALIAS matching, so it would not preserve the
module-autoload flow that the current platform-device based users rely on.

In other words, the parent arm-smccc device represents the firmware
resource exposed through the SMCCC conduit, and each auxiliary child
represents one discovered firmware service of that parent. This removes the
unnecessary per-feature platform devices while retaining automatic loading
and independent subsystem drivers for the SMCCC services.

The TSM framework uses the device abstraction to provide cross-architecture
TSM and TEE I/O functionality, including enumerating available platform TEE
I/O capabilities and provisioning connections between the platform TSM and
device DSMs.  For Arm CCA, the RSI auxiliary device continues to provide the
device anchor used by the CCA guest TSM provider.

For the CCA platform, the resulting device hierarchy appears as follows.
Note that the auxiliary device is parented by the arm-smccc platform device,
so the sysfs path remains under /devices/platform/arm-smccc/:

$ cd /sys/class/tsm/
$ ls -al
total 0
drwxr-xr-x    2 root     root             0 Jan  1 00:02 .
drwxr-xr-x   23 root     root             0 Jan  1 00:00 ..
lrwxrwxrwx    1 root     root             0 Jan  1 00:03 tsm0 -> ../../devices/platform/arm-smccc/arm_cca_guest.arm-rsi-dev.0/tsm/tsm0
$

The series also replaces the old arm-cca-dev userspace-visible dummy device
with /sys/firmware/cca/realm_guest for detecting whether the kernel is
running in a Realm.  This keeps the guest-state ABI under /sys/firmware and
separates it from the internal driver-binding device used by the CCA guest
TSM provider.


-aneesh
