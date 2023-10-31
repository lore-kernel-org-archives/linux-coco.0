Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9FCD1DFC9
	for <linux-coco@lists.linux.dev>; Tue, 31 Oct 2023 23:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VZ9FLcY3"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-53eeb28e8e5so2601a12.1
        for <linux-coco@lists.linux.dev>; Tue, 31 Oct 2023 16:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698795670; x=1699400470; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zggeX0Jrb9ZkmTPvrH2f7IhIYusHsgDJwAs8nPg2uwQ=;
        b=VZ9FLcY3zdY0L7jig7ddw0Z6XspQ4oaCVe7wg4/QtecIVECk7EYef6yh9UV/CN77ix
         tRqSRRawZlC4qtfxdao7V4jrbA5Zwcn1Gsh4UVoFVjjwv0mFkBcNPzfkM/6htRD/miYZ
         meVsI4y89l5KR8hk3FiTVF1Dz3c1yX0UGjblt7gRNkL/i4iZwr+eBWKROaPEF/fqa6zt
         +5ngvTZePv8gUQz1x37Jp/N+eQcfn10vKatNUQCdg8alqKPRCAXDVpV+ltEt9ZEYt49I
         t+zDJArQvN/dGWBGz/lXq4Pncmd1LgVuH3tTgN3WkV9FqZX/8RnnVRI84Bs0pp8W/HYW
         +h4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698795670; x=1699400470;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zggeX0Jrb9ZkmTPvrH2f7IhIYusHsgDJwAs8nPg2uwQ=;
        b=uTKcRJ3cZoS8DBdBaa7Azp1U135M9M4/L088UN0daB2FfJN5nsP797+Z+XWACDzkOy
         5KMceW6A8WbPyasPQh2PODMp/GJ26pCE6m3V1vi4F59ZO+kK+A16g08tSDjV/oljORKm
         jCrbaqFxTB9WK+R3lYQysqYKPnA8Q2UVXElRpWxjdAEzKEKwemfU7B2W6WygZl5l0g7+
         mLwY4FeRd7qZdfaguKuSa1EiQJBssFOasdd0USfY+R5fPZ15cedCPrwk4xnvmp5laBcB
         KIShLMY0t/pUduoFBYHB6nYR5enbwmQ6p9BCEFPMwbk/T/6XCUA49EAyQFgaOgM3aKu1
         na5g==
X-Gm-Message-State: AOJu0YwYyE45YJhUycutdxssqohXuUI2+cMFS9rzPpuV8wpcbGmCVm8o
	zjqBKTCdrw76JGHlHsNCL42xcJKejnkCq+TlSlghjA==
X-Google-Smtp-Source: AGHT+IH8smVyAPSV4skfSfLcHBheaSGA0wMn4dpV16jIlV7oMI0/LSUcNdrWjjR8D/Y7TxygXaM1FPDn2qMh12c09io=
X-Received: by 2002:a05:6402:17da:b0:543:72e1:7f7 with SMTP id
 s26-20020a05640217da00b0054372e107f7mr160542edy.1.1698795669923; Tue, 31 Oct
 2023 16:41:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <e05eafd8-04b3-4953-8bca-dc321c1a60b9@amd.com>
In-Reply-To: <e05eafd8-04b3-4953-8bca-dc321c1a60b9@amd.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Tue, 31 Oct 2023 16:40:56 -0700
Message-ID: <CAAH4kHYgMKv2xYT8=4Vx7i8hhpCOMZNdzf8G4fbNdx=9gQ8Y1w@mail.gmail.com>
Subject: Re: TDISP enablement
To: Alexey Kardashevskiy <aik@amd.com>
Cc: linux-coco@lists.linux.dev, kvm@vger.kernel.org, linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 31, 2023 at 3:56=E2=80=AFPM Alexey Kardashevskiy <aik@amd.com> =
wrote:
>
> Hi everyone,
>
Hi Alexey.

> Here is followup after the Dan's community call we had weeks ago.
>
> Our (AMD) goal at the moment is TDISP to pass through SRIOV VFs to
> confidential VMs without trusting the HV and with enabled IDE
> (encryption) and IOMMU (performance, compared to current SWIOTLB). I am
> aware of other uses and vendors and I spend hours unsuccessfully trying
> to generalize all this in a meaningful way.
>
> The AMD SEV TIO verbs can be simplified as:
>
> - device_connect - starts CMA/SPDM session, returns measurements/certs,
> runs IDE_KM to program the keys;
> - device_reclaim - undo the connect;
> - tdi_bind - transition the TDI to TDISP's LOCKED and RUN states,
> generates interface report;
> - tdi_unbind - undo the bind;
> - tdi_info - read measurements/certs/interface report;

Only read? Can user space not provide a nonce for replay protection
here, or is that just inherent to the SPDM channel setup, and the
user's replay-protected acceptance of the booted code, including this
SPDM communication logic?
I'm not fully up to speed here.

> - tdi_validate - unlock TDI's MMIO and IOMMU (or invalidate, depends on
> the parameters).
>
> The first 4 called by the host OS, the last two by the TVM ("Trusted
> VM"). These are implemented in the AMD PSP (platform processor).
> There are CMA/SPDM, IDE_KV, TDISP in use.
>
> Now, my strawman code does this on the host (I simplified a bit):
> - after PCI discovery but before probing: walk through all TDISP-capable
> (TEE-IO in PCIe caps) endpoint devices and call device_connect;
> - when drivers probe - it is all set up and the device measurements are
> visible to the driver;
> - when constructing a TVM, tdi_bind is called;
>
> and then in the TVM:
> - after PCI discovery but before probing: walk through all TDIs (which
> will have TEE IO bit set) and call tdi_info, verify the report, if ok -
> call tdi_validate;
> - when drivers probe - it is all set up and the driver decides if/which
> DMA mode to use (SWIOTLB or direct), or panic().
>
>
> Uff. Too long already. Sorry. Now, go to the problems:
>
> If the user wants only CMA/SPDM, the Lukas'es patched will do that
> without the PSP. This may co-exist with the AMD PSP (if the endpoint
> allows multiple sessions).
>
> If the user wants only IDE, the AMD PSP's device_connect needs to be
> called and the host OS does not get to know the IDE keys. Other vendors
> allow programming IDE keys to the RC on the baremetal, and this also may
> co-exist with a TSM running outside of Linux - the host still manages
> trafic classes and streams.
>
> If the user wants TDISP for VMs, this assumes the user does not trust
> the host OS and therefore the TSM (which is trusted) has to do CMA/SPDM
> and IDE.
>
> The TSM code is not Linux and not shared among vendors. CMA/SPDM and IDE
> seem capable of co-existing, TDISP does not.
>
> However there are common bits.
> - certificates/measurements/reports blobs: storing, presenting to the
> userspace (results of device_connect and tdi_bind);
> - place where we want to authenticate the device and enable IDE
> (device_connect);
> - place where we want to bind TDI to a TVM (tdi_bind).
>
> I've tried to address this with my (poorly named)
> drivers/pci/pcie/tdisp.ko and a hack for VFIO PCI device to call tdi_bind=
.
>
> The next steps:
> - expose blobs via configfs (like Dan did configfs-tsm);

I think that the blob interface should be reworked, as Sean and I have
commented on for the SEV-SNP host patch series.
For example, the amount of memory needed for the blob should be
configurable by the host through a proposed size.
These vendored certificates will only grow in size, and they're
device-specific, so it makes sense for machines to have a local cache
of all the provisioned certificates that get forwarded to the guest
through the VMM. I'd like to see this kind of blob reporting as a more
general mechanism, however, so we can get TDX-specific blobs in too
without much fuss.

I'm not _fully_ opposed to ditching this blob idea and just requiring
the guest to contact a RIM service for all these certs, but generally
I think that's a bit of an objectionable barrier to entry. And more
work I'll need to do, lol. Probably still will have to eventually for
short-lived claims.
We then have another API to try to standardize that IETF RATS doesn't
try to touch.

All that aside, it doesn't seem like tsm/report is going to be the
right place to get attestations from various devices. It's only
designed for attesting the CPU. Would the idea be to have a new WO
attribute that is some kind of TDI id, and that multiplexes out to the
different TDI?

> - s/tdisp.ko/coco.ko/;
> - ask the audience - what is missing to make it reusable for other
> vendors and uses?
>
> Thanks,
> --
> Alexey
>
>
>


--
-Dionna Glaze, PhD (she/her)
