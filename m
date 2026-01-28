Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67CF36F421
	for <linux-coco@lists.linux.dev>; Wed, 28 Jan 2026 17:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769622792; cv=pass; b=pV3g300+9tvlLMgpc8D+OLkSSkmKttSzJ86NIpcDIllFP5yoCO8/Lb20AQCK0tMPTXGWUXWytQTQLZVD491yyYNrR0bJHvRcQJWPxIH2jJACDVHGZCYcgs20vPn8+lRvMhiShMQjuO7bhjMt6I4S/QON66eTCqqZgU3f24rQrh0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769622792; c=relaxed/simple;
	bh=0JNyYRfD4pK3Gn5sKXp0ZdkKSMwLlaan3pWRhsoE9hQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uAP76dqdBYCAC38RA4Upjl8+iCJRRe2uJBy1nPPjapliuYkwCqFsR27lOM+2d7e19SW/qU9joyuzUmkubwlhzIhZnZ4v5f6StnUKh/QUvaT33zQgUJxEAjviKJ6BdipBEtANcN+c2AYFgclRv75216K5Or4+ZGUXogA5zPR5CVM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WJV+Rd0U; arc=pass smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WJV+Rd0U"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-50299648ae9so5451cf.1
        for <linux-coco@lists.linux.dev>; Wed, 28 Jan 2026 09:53:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769622790; cv=none;
        d=google.com; s=arc-20240605;
        b=ZXrY/N4d9w3ohbjNOvU9RCWx1fVHDohCXo3rRwUYKQheK45dcaoaJnL9bxwTrvnvlm
         EkXJWOyjPk+/YXVuPbH0irGXZTibxtFqBvuNxwpY1SgIX7iGedXUPwySn7j/PeZPIKgr
         5LkkmRw8N6bI+QJMijSIMnPKcjJVMSNGofIFw6SlQiEbFZ1XXgx14853Vxo99du3RKF6
         rraAKSfIS6Z5wN2vVOhj8HVT4qMmmBp/Tp2YCQDC4cDxOxuN4PUI5/eq+3+h+L2z9te7
         xuaCS7IqIii6ONeEVFjd1ASc7HHqDBOCl6QDtCuvvBzeUs3a9X7iN7XKNEicweDgRXqF
         yZ/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OWg7kuA2s1ZghD76X/T/DMqAQsZITYOyFuy/en9KwNw=;
        fh=No4dOkIqDR6ZQe3FGbNEMeFH+jWAF9PhsDcXTSOdHQQ=;
        b=iq++9HAF1KqJViSxbofRB0EHJqlgTuHEInF+vg7jKENYVWRgJM/ukCtQhJLxwxHvAb
         WCxbocqqBVLGq+6PoFN+OrHxSMCyzn4KpB9ioMXpn3sE8QUelN3qj/5bW03MceXzpkIW
         mLnkzR+PBVAGPX2LTbacW/Y1NyQVPJSgcE5V6k8ZEk7qoh24RTrUqqsl/qj+cqRHcj5i
         09/22CfJBOXauDITccefnMv7j8NEMuq1Uz79X4pSUj+cGwU+1F+1FAvfIotQc+H5Y2Mj
         yKVvgLyaH+dboh6zXpBsp9lzgYZZO0CXq2pWV3i54ksYXaX6Oyc3A3f8/0xwaAROhyVT
         H1Sw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769622790; x=1770227590; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OWg7kuA2s1ZghD76X/T/DMqAQsZITYOyFuy/en9KwNw=;
        b=WJV+Rd0UCOat0dpNSdBiWQHCS4AnaLFJLWn7Tjb8Tav8HKFFz3XeixryoO48IlnwGI
         YaumQpUGYpRGwISSnTuUJpNxqWIE4J/VH8S3BH7c4PZeiwqSnphjdkUhwlqUPNKweaB6
         P7LMlinUPtb3PbSz/3F5faFEEmhSesOXB6/2fHrsc8mjUVF3VXMAD8D2Va+xn/b0mABP
         GCqTUxG8u2u4vy2xgiDbzU78cp4tAb08b3kNVyDcb+MG5kIt7mIYEIardZjmMKBO50YL
         YSEt6N0k1HOwgibQxABRTxIrjIjqX3FMN+fz+Dndmw6jMSI9jZcHutLDwOLxuojIiJqw
         xtpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769622790; x=1770227590;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OWg7kuA2s1ZghD76X/T/DMqAQsZITYOyFuy/en9KwNw=;
        b=lIKgNTtAKJ7eoKP2tellHZV1EAwQaSa6lujuSCaB4LcFcutWHKwaIkuStunEMxqJ1a
         ESQBhfdP7m3BxrnElS+dUCVfQvXw7Sqek52En0uzlg/b3B6B3FiMimqNWMSMsv0KU0W7
         XUDUhPGabSzzHGbC8oPpP4M/vfGjXdAyp1Mej+mN40wcy21vM9Mp1nU+wJ4QNKKJvgta
         BPAqA359RWPQ9CInl3w5RAJNhEKWUT3gUyW692Xz8NMhpj2QaUQUiW38dRVyTAFtxbum
         3NYVV/BiVzYc0kOIWrX9SW04H16plifGzLtSQQN2irrSBP8yXTaF4tNvVuMgrwO8VkD5
         wyNw==
X-Gm-Message-State: AOJu0Yw8qA6+U/INtogAoSgciC+LQ5icKpESU8qk4kYvmFEQnQgMWFho
	N7L+3Cr1YtCEGkQPQCJk2JwMXeSJKM3BpxBrUbIhHtTZTuIuaAnkTRDicv0E94nfjwuVAb7PKIZ
	e2Rwg1HUiWVrVlMI+Rn7Pj4vEg/A5rLkIQj9CeLTX
X-Gm-Gg: AZuq6aLqOfI79M8vhm84epqcpxcNic1zyzA4M+jhl5sOAJ2nvqSs8xN8xBa3reksGoU
	VvVcS471PQ0qcad/6s80KjhQNrVV65hI9wLcJ7/dBskPR3z+4X4szYcndqINnin6/bWFTh9Jzxk
	zJs2dA2U3TtPv+dWjF9WwSbtOA9JwlFOI7mc7nY9K1ib2SJUyl3GuM1xwJyjP/X+V07hzZlYxB8
	O80z23PiOwUWj3kF+XJtrVEGdkFY1UP9DIKIRcApVvO6IIKY3lzSZg4dfRiQ1FiIS6vlsheN2r/
	xeqh1SL8thyF8JIcKbongEs921Ak
X-Received: by 2002:a05:622a:207:b0:4f3:54eb:f26e with SMTP id
 d75a77b69052e-5032f44b381mr25111221cf.1.1769622789108; Wed, 28 Jan 2026
 09:53:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260123145645.90444-1-chao.gao@intel.com>
In-Reply-To: <20260123145645.90444-1-chao.gao@intel.com>
From: Sagi Shahar <sagis@google.com>
Date: Wed, 28 Jan 2026 11:52:57 -0600
X-Gm-Features: AZwV_QjcsrND87lEXRg4pv4cTGfcU_Ck3XA1UdyCiBp-d69y5I0sJ7mdSftPq8M
Message-ID: <CAAhR5DG7EOpmKYV4WmiyNYr14rKMNuTcqgvoaeZt5-==kSPmuw@mail.gmail.com>
Subject: Re: [PATCH v3 00/26] Runtime TDX Module update support
To: Chao Gao <chao.gao@intel.com>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, x86@kernel.org, reinette.chatre@intel.com, 
	ira.weiny@intel.com, kai.huang@intel.com, dan.j.williams@intel.com, 
	yilun.xu@linux.intel.com, vannapurve@google.com, paulmck@kernel.org, 
	nik.borisov@suse.com, zhenzhong.duan@intel.com, seanjc@google.com, 
	rick.p.edgecombe@intel.com, kas@kernel.org, dave.hansen@linux.intel.com, 
	vishal.l.verma@intel.com, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, 
	Ingo Molnar <mingo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 23, 2026 at 9:00=E2=80=AFAM Chao Gao <chao.gao@intel.com> wrote=
:
>
> Hi Reviewers,
>
> With this posting, I'm hoping to collect more Reviewed-by or Acked-by tag=
s.
> Dave, since this version is still light on acks, it might not be ready fo=
r
> your review.
>
> Changelog:
> v2->v3:
>  - Make this series self-contained and independently runnable, testable a=
nd
>    reviewable by
>
>    * Including dependent patches such as TDX Module version exposure and =
TDX
>      faux device creation

I see "x86/virt/tdx: Retrieve TDX module version" and "x86/virt/tdx:
Print TDX module version during init" in the github link but I don't
see them as part of this series. Were they posted/accepted as part of
a different series?

Trying to build this series without them fails since
tdx_sysinfo.version is undefined.

>
>    * Removing dependency on Sean's VMXON cleanups for now, the tdx-host d=
evice
>      simply checks that the TDX module is initialized, regardless of when=
 or
>      who performed the initialization.
>
>      Note: If the KVM module is unloaded, all services exposed by the tdx=
-host
>      device will fail. This shouldn't be a big issue since proper errors =
will
>      be returned to userspace, similar to other failure cases.
>
>  - Handle updates during update-sensitive times and documented expectatio=
ns for
>    TDX Module updates
>  - Rework how updates are aborted when errors occur midway
>  - Map Linux error codes to firmware upload error codes
>  - Preserve bit 63 in P-SEAMLDR SEAMCALL leaf numbers and display them in=
 hex
>  - Do not fail the entire tdx-host device when update features encounter =
errors
>  - Drop superfluous is_visible() function for P-SEAMLDR sysfs nodes
>  - Add support for sigstruct sizes up to 16KB
>  - Move CONFIG_INTEL_TDX_MODULE_UPDATE kconfig entry under TDX_HOST_SERVI=
CES
>  - Various cleanups and changelog improvements for clarity and consistenc=
y
>  - Collect review tags from ZhenZhong and Jonathan
>  - v2: https://lore.kernel.org/linux-coco/20251001025442.427697-1-chao.ga=
o@intel.com/
>
> This series adds support for runtime TDX Module updates that preserve
> running TDX guests. It is also available at:
>
>   https://github.com/gaochaointel/linux-dev/commits/tdx-module-updates-v3=
/
>
> =3D=3D Background =3D=3D
>
> Intel TDX isolates Trusted Domains (TDs), or confidential guests, from th=
e
> host. A key component of Intel TDX is the TDX Module, which enforces
> security policies to protect the memory and CPU states of TDs from the
> host. However, the TDX Module is software that require updates.
>
> =3D=3D Problems =3D=3D
>
> Currently, the TDX Module is loaded by the BIOS at boot time, and the onl=
y
> way to update it is through a reboot, which results in significant system
> downtime. Users expect the TDX Module to be updatable at runtime without
> disrupting TDX guests.
>
> =3D=3D Solution =3D=3D
>
> On TDX platforms, P-SEAMLDR[1] is a component within the protected SEAM
> range. It is loaded by the BIOS and provides the host with functions to
> install a TDX Module at runtime.
>
> Implement a TDX Module update facility via the fw_upload mechanism. Given
> that there is variability in which module update to load based on feature=
s,
> fix levels, and potentially reloading the same version for error recovery
> scenarios, the explicit userspace chosen payload flexibility of fw_upload
> is attractive.
>
> This design allows the kernel to accept a bitstream instead of loading a
> named file from the filesystem, as the module selection and policy
> enforcement for TDX Modules are quite complex (see more in patch 8). By
> doing so, much of this complexity is shifted out of the kernel. The kerne=
l
> need to expose information, such as the TDX Module version, to userspace.
> Userspace must understand the TDX Module versioning scheme and update
> policy to select the appropriate TDX Module (see "TDX Module Versioning"
> below).
>
> In the unlikely event the update fails, for example userspace picks an
> incompatible update image, or the image is otherwise corrupted, all TDs
> will experience SEAMCALL failures and be killed. The recovery of TD
> operation from that event requires a reboot.
>
> Given there is no mechanism to quiesce SEAMCALLs, the TDs themselves must
> pause execution over an update. The most straightforward way to meet the
> 'pause TDs while update executes' constraint is to run the update in
> stop_machine() context. All other evaluated solutions export more
> complexity to KVM, or exports more fragility to userspace.
>
> =3D=3D How to test this series =3D=3D
>
> First, load kvm-intel.ko and tdx-host.ko if they haven't been loaded:
>
>  # modprobe -r kvm_intel
>  # modprobe kvm_intel tdx=3D1
>  # modprobe tdx-host
>
> Then, use the userspace tool below to select the appropriate TDX module a=
nd
> install it via the interfaces exposed by this series:
>
>  # git clone https://github.com/intel/tdx-module-binaries
>  # cd tdx-module-binaries
>  # python version_select_and_load.py --update
>
> =3D=3D Other information relevant to Runtime TDX Module updates =3D=3D
>
> =3D=3D=3D TDX Module versioning =3D=3D=3D
>
> Each TDX Module is assigned a version number x.y.z, where x represents th=
e
> "major" version, y the "minor" version, and z the "update" version.
>
> Runtime TDX Module updates are restricted to Z-stream releases.
>
> Note that Z-stream releases do not necessarily guarantee compatibility. A
> new release may not be compatible with all previous versions. To address =
this,
> Intel provides a separate file containing compatibility information, whic=
h
> specifies the minimum module version required for a particular update. Th=
is
> information is referenced by the tool to determine if two modules are
> compatible.
>
> =3D=3D=3D TCB Stability =3D=3D=3D
>
> Updates change the TCB as viewed by attestation reports. In TDX there is
> a distinction between launch-time version and current version where
> runtime TDX Module updates cause that latter version number to change,
> subject to Z-stream constraints.
>
> The concern that a malicious host may attack confidential VMs by loading
> insecure updates was addressed by Alex in [3]. Similarly, the scenario
> where some "theoretical paranoid tenant" in the cloud wants to audit
> updates and stop trusting the host after updates until audit completion
> was also addressed in [4]. Users not in the cloud control the host machin=
e
> and can manage updates themselves, so they don't have these concerns.
>
> See more about the implications of current TCB version changes in
> attestation as summarized by Dave in [5].
>
> =3D=3D=3D TDX Module Distribution Model =3D=3D=3D
>
> At a high level, Intel publishes all TDX Modules on the github [2], along
> with a mapping_file.json which documents the compatibility information
> about each TDX Module and a userspace tool to install the TDX Module. OS
> vendors can package these modules and distribute them. Administrators
> install the package and use the tool to select the appropriate TDX Module
> and install it via the interfaces exposed by this series.
>
> [1]: https://cdrdv2.intel.com/v1/dl/getContent/733584
> [2]: https://github.com/intel/tdx-module-binaries
> [3]: https://lore.kernel.org/all/665c5ae0-4b7c-4852-8995-255adf7b3a2f@ama=
zon.com/
> [4]: https://lore.kernel.org/all/5d1da767-491b-4077-b472-2cc3d73246d6@ama=
zon.com/
> [5]: https://lore.kernel.org/all/94d6047e-3b7c-4bc1-819c-85c16ff85abf@int=
el.com/
>
> Chao Gao (25):
>   x86/virt/tdx: Print SEAMCALL leaf numbers in decimal
>   x86/virt/tdx: Use %# prefix for hex values in SEAMCALL error messages
>   coco/tdx-host: Introduce a "tdx_host" device
>   coco/tdx-host: Expose TDX Module version
>   x86/virt/tdx: Prepare to support P-SEAMLDR SEAMCALLs
>   x86/virt/seamldr: Introduce a wrapper for P-SEAMLDR SEAMCALLs
>   x86/virt/seamldr: Retrieve P-SEAMLDR information
>   coco/tdx-host: Expose P-SEAMLDR information via sysfs
>   coco/tdx-host: Implement FW_UPLOAD sysfs ABI for TDX Module updates
>   x86/virt/seamldr: Block TDX Module updates if any CPU is offline
>   x86/virt/seamldr: Verify availability of slots for TDX Module updates
>   x86/virt/seamldr: Allocate and populate a module update request
>   x86/virt/seamldr: Introduce skeleton for TDX Module updates
>   x86/virt/seamldr: Abort updates if errors occurred midway
>   x86/virt/seamldr: Shut down the current TDX module
>   x86/virt/tdx: Reset software states after TDX module shutdown
>   x86/virt/seamldr: Log TDX Module update failures
>   x86/virt/seamldr: Install a new TDX Module
>   x86/virt/seamldr: Do TDX per-CPU initialization after updates
>   x86/virt/tdx: Establish contexts for the new TDX Module
>   x86/virt/tdx: Update tdx_sysinfo and check features post-update
>   x86/virt/tdx: Enable TDX Module runtime updates
>   x86/virt/seamldr: Extend sigstruct to 16KB
>   x86/virt/tdx: Avoid updates during update-sensitive operations
>   coco/tdx-host: Set and document TDX Module update expectations
>
> Kai Huang (1):
>   x86/virt/tdx: Move low level SEAMCALL helpers out of <asm/tdx.h>
>
>  .../ABI/testing/sysfs-devices-faux-tdx-host   |  76 ++++
>  arch/x86/include/asm/seamldr.h                |  29 ++
>  arch/x86/include/asm/tdx.h                    |  66 +--
>  arch/x86/include/asm/tdx_global_metadata.h    |   5 +
>  arch/x86/kvm/vmx/tdx_errno.h                  |   2 -
>  arch/x86/virt/vmx/tdx/Makefile                |   1 +
>  arch/x86/virt/vmx/tdx/seamcall.h              | 125 ++++++
>  arch/x86/virt/vmx/tdx/seamldr.c               | 398 ++++++++++++++++++
>  arch/x86/virt/vmx/tdx/tdx.c                   | 153 ++++---
>  arch/x86/virt/vmx/tdx/tdx.h                   |  11 +-
>  arch/x86/virt/vmx/tdx/tdx_global_metadata.c   |  13 +
>  drivers/virt/coco/Kconfig                     |   2 +
>  drivers/virt/coco/Makefile                    |   1 +
>  drivers/virt/coco/tdx-host/Kconfig            |  22 +
>  drivers/virt/coco/tdx-host/Makefile           |   1 +
>  drivers/virt/coco/tdx-host/tdx-host.c         | 260 ++++++++++++
>  16 files changed, 1064 insertions(+), 101 deletions(-)
>  create mode 100644 Documentation/ABI/testing/sysfs-devices-faux-tdx-host
>  create mode 100644 arch/x86/include/asm/seamldr.h
>  create mode 100644 arch/x86/virt/vmx/tdx/seamcall.h
>  create mode 100644 arch/x86/virt/vmx/tdx/seamldr.c
>  create mode 100644 drivers/virt/coco/tdx-host/Kconfig
>  create mode 100644 drivers/virt/coco/tdx-host/Makefile
>  create mode 100644 drivers/virt/coco/tdx-host/tdx-host.c
>
> --
> 2.47.3
>
>
