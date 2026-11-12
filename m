Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794488699;
	b=Qh+szyhg51VqLKAdEIz6wXuX/jrQ2xO6/VgOMavH7XmWNURIAGLy48zRSQFkl9DiqmC+
	 XCUb6KHT8MgcwXeMi80WvFyFQigg34EoU0/rZPzlNZSCCIDl66WsaYNwIKx2nRwq2WM+n
	 WoQ7Nxqdx37sdTgCAJzUopgmq6fvgI3yAhF7/F2RPJXNWs2OpuXVOxsfPD0yMNj+Cfaol
	 4JKHkntA7ct9yVn91dyRXnTjJiF8J9euunUDgO+97Gw/VcuFhR8D7sOU+Co0AQE2ffgEY
	 aie/VXj5QQ2bMXXcyDJqGGQRgy8/0NAc2g2oDzlS+Y5Uq0OtUnUm7eUFthDg8ws3jjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794488699;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=h1+IeBKxX3Rc2XWmJoyUnkuer6jdlGiO0bD9yZSARb0=;
	b=wLZ1/26fxF/67u2qTs5mMGVMo+Vcc9pN3pb5/86zP+w1qhioI7hFXDfzAdSCuczlGCUt
	 PaU+oefaUgu8BpAru6cfKAxv56bxBqa3p1Dm3i5hJqC/oE0D90BWGrdmNVGAtpKt5BiYy
	 MDJwhRAJ/pAds2wh5bOxriYcgY1Cs40HvEmNmcZOpF1Vs2stbZPJtCjrmKBxdIVmXLIj6
	 pk/WLT9raLV9VXd7ccFICovML62SR9UT/ENZrLuYtLFn9b9aLk0OAEHXbWdYSS4PaeWEu
	 XUebwW3vTvdVIL/MGh2sMDHTrb3kaqAjKC62/4kc7ZELOOmcP3wZUlV8Nv60k5gXDlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=f0Kx3a+8;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847B8606A31C
	for <linux-coco@lists.linux.dev>; Thu, 12 Nov 2026 13:04:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 847B8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=f0Kx3a+8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794488699; x=1826024699;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=BWgavzikl2eqq5qY1MsW9Z4K1UaYVpg8E7kBNt+0svQ=;
  b=f0Kx3a+8Lr+kW8mPpM/9ZVKDdx0lWphj700tNNxCX/Gn8WADZvQYr5Zg
   pL+Ef1NRAuddC3SxWqWmBYxZB9ZYh9ecD3qxiAOjLe4pUm3HbTob+UkqY
   tYvsFhjQZDK3+B3V8QeRJT+jvjSdGt4IZH22s1n5ZfNzO6EeoTWt9fV+n
   Yoi19IK181UeeaeH6yMy/zBSrcdbzxMjmzTz+fCpDBu2+SXSdyBVhfkN6
   pXgcKuw2vdBWYId4qK4kCfUbJ+gtL4+xcpYx4w/diD89aqUCMUDR1SxOT
   UGaV6w27nOUyhwkQTOcdapVE0tZyrBYH8hScC7iHZBZ2FVf9UjuZSrXWe
   g==;
X-CSE-ConnectionGUID: eGpkqWwbTUyRqbRNOrANQQ==
X-CSE-MsgGUID: aKSJWgWpTx2Htaw6aq5dvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3307862"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3307862"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 05:04:58 -0800
X-CSE-ConnectionGUID: 2oVPJaltRN2oScohpW2vHw==
X-CSE-MsgGUID: 2OjCO5oRRtShQEBWktvP5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="8835411"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.47.46])
  by orviesa009.jf.intel.com with ESMTP; 12 Nov 2026 05:04:53 -0800
Date: Thu, 12 Nov 2026 20:56:45 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>,
	"Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"Li, Xiaoyao" <xiaoyao.li@intel.com>,
	"Hansen, Dave" <dave.hansen@intel.com>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"kas@kernel.org" <kas@kernel.org>,
	"seanjc@google.com" <seanjc@google.com>,
	"mingo@redhat.com" <mingo@redhat.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>,
	"nik.borisov@suse.com" <nik.borisov@suse.com>,
	"aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>,
	"Verma, Vishal L" <vishal.l.verma@intel.com>,
	"Peng, Chao P" <chao.p.peng@intel.com>,
	"hpa@zytor.com" <hpa@zytor.com>,
	"tglx@kernel.org" <tglx@kernel.org>,
	"nicolinc@nvidia.com" <nicolinc@nvidia.com>,
	"Duan, Zhenzhong" <zhenzhong.duan@intel.com>,
	"bp@alien8.de" <bp@alien8.de>, "Gao, Chao" <chao.gao@intel.com>,
	"aik@amd.com" <aik@amd.com>, "x86@kernel.org" <x86@kernel.org>
Subject: Re: [RFC PATCH 06/15] virt: tdx-guest: Support TDI bind and unbind
 operations
Message-ID: <avW3jZYB5/L4WaGL@yilunxu-OptiPlex-7050>
References: <IA3PR11MB9136FE2B23CA52EC68EF2139926E2@IA3PR11MB9136.namprd11.prod.outlook.com>
 <bd0f63af98521d76e0d34ea31f18accc063d1d27.camel@intel.com>
 <IA3PR11MB9136FEF30F06D8D5118B389292692@IA3PR11MB9136.namprd11.prod.outlook.com>
 <a63e7dbdba277b5a551ec74d09144e97f55504dc.camel@intel.com>
 <IA3PR11MB91369A1E95D047DBEDB53B7892722@IA3PR11MB9136.namprd11.prod.outlook.com>
 <f1cdd989f6bcf6a177dcd83e55fb8465e0ee849f.camel@intel.com>
 <20261110195745.GG738765@nvidia.com>
 <e44f3f12b3fecdc5f3c05aa1f1b0ceb1befad0b7.camel@intel.com>
 <20261111001606.GH738765@nvidia.com>
 <CO1PR11MB4835656CEB24B31B557162258C712@CO1PR11MB4835.namprd11.prod.outlook.com>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CO1PR11MB4835656CEB24B31B557162258C712@CO1PR11MB4835.namprd11.prod.outlook.com>

On Wed, Nov 11, 2026 at 09:44:42AM +0000, Tian, Kevin wrote:
> > From: Jason Gunthorpe <jgg@nvidia.com>
> > Sent: Wednesday, November 11, 2026 8:16 AM
> > 
> > On Tue, Nov 10, 2026 at 10:25:07PM +0000, Edgecombe, Rick P wrote:
> > > On Tue, 2026-11-10 at 15:57 -0400, Jason Gunthorpe wrote:
> > > > On Tue, Nov 10, 2026 at 06:55:41PM +0000, Edgecombe, Rick P wrote:
> > > >
> > > > > Additionally, we should probably see if Jason has any opinion on the
> > types of
> > > > > errors that guest TSM would like to handle.
> > > >
> > > > Not at this point :\ And perhaps not at all.
> > > >
> > > > Most of this stuff will end up routing through userspace so it has to
> > > > be compressed into a errno.'
> > > >
> > > > The various VMM to guest specs like GHCI are going to define their own
> > > > contracts, and it is up to Intel to ensure that the full route from
> > > >   this code -> attestation subsystem -> uapi -> vmm -> GHCI
> > > >
> > > > Preserves whatever semantics have been defined in the spec.
> > > >
> > > > I don't know the answer to the EBUSY question, other than
> > > > TSM/attestation will return that to userspace. Can your VMM and GHCI
> > > > sort it out?
> 
> GHCI doesn't define a EBUSY error code. So it's more a TD internal policy.
> 
> A status byte in the GHCI data buffer indicates whether the requested
> operation is completed by the VMM (successfully or with error). It's
> unreasonable to poll it indefinitely so the polling will be capped by a
> timeout. Then a 2nd request comes and observes previous request
> still in progress, then -EBUSY is returned.
> 
> Such failures (timeout or busy) before attestation passes are just
> returned to userspace, as Jason suggested. it's fine.
> 
> The interesting case is about such failures after attest e.g. unlock
> which is supposed to be a void operation. Maybe we don't need do
> anything special in tsm core - the secure firmware maintains the
> state machine so future lock will fail if the current state is not
> unlocked. 
> 
> Anyway the success or error code from GHCI is just a hint and
> untrusted.
> 
> > >
> > > Kevin and Yilun are analyzing what kind of errors we should expect the VMM
> > to
> > > handle. But some of the cases Zhenzhong listed seem like they could be
> > > situations trusted IO guests could encounter generally. Like the example
> > > "[device] firmware hangs during lock/unlock". In that case unification in TSM
> > > could be nice.
> 
> As long as we rely on the secure firmware to manage the TDI state machine
> properly, it doesn't matter whether an uncompleted lock/unlock is caused
> by device firmware hang, or any intermediate software layer serving the
> GHCI call.
> 
> Generally for errors which confine to an assigned device, the guest just
> keeps running. In the end the related driver stack in the guest will capture
> the device error and quarantine the device in its own way.
> 
> So the TD just needs to handle errors according to the GHCI spec:
> 
> [GHCI general]
> 	TDG.VP.VMCALL_INVALID_OPERAND
> 	TDG.VP.VMCALL_SUBFUNC_UNSUPPORTED
> 
> [TDCM specific]
> 	TDX_MODULE_ERROR

This error handling belongs to the host, guest can't understand. 

> 	TDXIO_DEVICE_ERROR

This is actually DOE error according to GHCI spec.

> 	SPDM_MESSAGE_ERROR
> 	IDE_KM_MESSAGE_ERROR

The above 3 errors indicate the link is broken. Guest could handle them
by unplugging the device. But there are always link broken events at any
time, host should handle them, guest can expect a notification from host
to do the unplugging. That's another topic.

So for TSM operations, guest kernel just keep the TDISP state unchanged
and report error to user.

BTW: UNLOCK is not needed when link is broken. So always good to let
UNLOCK succeed.

> 	TDISP_MESSAGE_ERROR
> 	INVALID_STATE

These 2 are about TDISP, guest can keep the state machine unchanged, and
report error to user. According to TDISP spec, UNLOCK can't fail on
these 2 errors.

> 
> For general errors let's follow the convention already established.
> 
> for TDCM specific ones they are not useful then let's just return a
> single errno (e.g. -EIO) for all of them to userspace.

For LOCK/RUN/GET_DEV_INFO/GET_TDI_REPORT, I agree.

For UNLOCK, guest kernel could always return success. We are always safe
to move the device to untrusted mode.

> 
> > >
> > > For errors that indicate uncooperative or buggy host, we elsewhere warn in
> > the
> > > TDX wrappers. But in coco, not handling an error in the caller can be an
> > avenue
> > > to attack the guest. So I guess we would commonly need to handle these

The secure firmware should guarantee the attack can't impact TSM
security. For DDOS attack, the guest could always move the device to
untrusted mode.

> > errors in
> > > the callers.
> > 
> > Any failure to attest should just propogate to guest userspace and
> > userspace wil fail the attestation and not enable the device. This is
> > fine.
> > 
> > All failure classes, including the cases where the guest is checking
> > digests/etc to confirm the host has done the right thing can work like
> > this.
> 
> Agree
> 
> > 
> > > Zhenzhong had previously suggested a bool to set a device as bugged for the
> > > purpose of trying to continue guest execution as well as possible in the face
> > of
> > > host issues.
> > 
> > It does not seem necessary to me, userspace is responsible. Since no
> > device evidence could possibly have been logged the VM would fail
> > attestation anyhow.
> > 
> 
> Yeah - as said even for errors after attest passes we could rely on secure
> firmware to do the right thing. Userspace requests unlock and downgrade
> the trust level to DISABLED. Failures will be caught in next attempt if
> unlock doesn't complete successfully.
> 
> We don't need the guest kernel to explicitly mark the buggy state. :)
