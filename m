Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A8B3BFAE0;
	Fri, 12 Jun 2026 06:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781244451; cv=none; b=FTM2SqOXPuv2i7rQrafwv1DJJU/hPlf84mzmbcMxK+xJOcJE36diSAjc4QIBeeqlFnaZgi/AWWnglK1zYao6Wp69YUvZ+z2TB4wDnzg3htwihLcs865uVIdN25aAKwrtUZmONhVU7eyhPeE3oHYz9MFeWCH77DGm0yXOTCLyi9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781244451; c=relaxed/simple;
	bh=NUiuoDz4pO2MTi6FiJPrA4A1WRUUQvlixKkKnXwPtMo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=GFtD+PftxenJnJNteuNKYeAqZoegyNyM0l3BBx6oIOS85kI35pdDDdO4SH5bpzZAkb8mdin/b9H8u7EoWCJ7bHi1yFEptPBS7+jY9XnJqLKiGHb+jbsmkjII7WeCTDDgAXYAO4NhUWbS88hIrQX6TpVE+QwnToaAsZaNe+SW7IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nx8t/LRc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nx8t/LRc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EC501F000E9;
	Fri, 12 Jun 2026 06:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781244447;
	bh=lZc1RTV345L63XOq87kbXXoUGCjhUQeZA+2I4SgZPyw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=Nx8t/LRc2OA1IAAWEbAg5Bw5U05V1wLwsnIRQp1t1GDuoZYRtK7rtNyrBHcQSsDxn
	 yQkKyG9h0bpw2tHlpzSySWZ7D9tnyJy5mlKycpkTOhIzJJGwnluywW67ItvzQ10XwN
	 wliG7Ioa788JdrnWMw4sCnVuEKNtfcP+fwCaAOXnHeXZtF5aCZA2DqzRoLvLHaaNx2
	 //20IDu5G047ukC+9ozWHjg1Mk6D9DOlQn3ZqmG1+L7BAAobBn9lxdWbMz8kM/cTX0
	 /LEraSEdXp3C8bayXip6r9Astz7Z1aGdI25iHw30aI5ni3NcTVCfi6L16tMw7Ezw3+
	 fcrw27L7jiihA==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: "Dan Williams (nvidia)" <djbw@kernel.org>,
	linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
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
Subject: Re: [PATCH v7 6/6] coco: guest: arm64: Replace dummy CCA device
 with sysfs ABI
In-Reply-To: <6a2b103d77596_344af1000@djbw-dev.notmuch>
References: <20260611130429.295516-1-aneesh.kumar@kernel.org>
 <20260611130429.295516-7-aneesh.kumar@kernel.org>
 <6a2b103d77596_344af1000@djbw-dev.notmuch>
Date: Fri, 12 Jun 2026 11:37:20 +0530
Message-ID: <yq5ay0gkl2av.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

"Dan Williams (nvidia)" <djbw@kernel.org> writes:

> Aneesh Kumar K.V (Arm) wrote:
>> The SMCCC firmware driver now creates the arm-smccc platform device and
>> instantiates the CCA RSI auxiliary devices once the RSI ABI is discovered.
>> The arm64-specific arm-cca-dev platform device stub is therefore no longer
>> needed.
>> 
>> However, userspace has used the arm-cca-dev platform device to detect Arm
>> CCA Realm guests [1]. Removing it without a replacement would break that
>> detection and would also leave userspace depending on kernel device-model
>> details.
>> 
>> Add /sys/firmware/cca/realm_guest as a stable, architecture-provided ABI
>> for detecting whether the kernel is running as an Arm CCA Realm guest. The
>> file returns 1 in Realm world and 0 otherwise, similar to the existing s390
>> /sys/firmware/uv/prot_virt_guest interface for protected virtualization
>> guests.
>> 
>> Remove the dummy arm-cca-dev registration now that userspace has a
>> dedicated CCA Realm guest indicator, and document the new ABI in
>> Documentation/ABI/testing/sysfs-firmware-cca.
>
> I would have expected an attribute in /sys/class/tsm/tsmX to be the
> common protected guest indicator. Then, if you need to distinguish the
> architecture that registered that tsm it would be in the name of the
> parent device for the tsm class device.
>

It is not clear whether we need this capability early, for example in an
initrd configuration before loading the TSM driver, since
systemd-detect-virt reports the CC architecture.

Also, the general feedback was not to depend on device names or paths to
identify a confidential computing guest. Hence, parsing paths such as
../../devices/arm-rmi-dev-1/tsm/tsm0 may not be advisable.

>
> That also gives you the property that a uevent has signalled the arrival
> of tsm guest services. Otherwise, userspace still needs some custom
> device-model details to know when it can start issuing tsm requests.
>
> Is auxilliary device arrival too late in the flow for what systemd
> needs?

Systemd uses that to build part of its trust model.

static int import_credentials_qemu(ImportCredentialsContext *c) {

        if (detect_container() > 0) /* don't access /sys/ in a container */
                return 0;

        if (detect_confidential_virtualization() > 0) /* don't trust firmware if confidential VMs */
                return 0;
....

It also use that to build environment settings 

cv = detect_confidential_virtualization();
if (cv > 0) {
        r = strv_env_assign(&nl, "SYSTEMD_CONFIDENTIAL_VIRTUALIZATION", confidential_virtualization_to_string(cv));

IIUC, this would require the facility to be present even before we can
load the full set of modules.

-aneesh
