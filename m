Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E7E256A
	for <linux-coco@lists.linux.dev>; Thu, 26 Jan 2023 13:32:14 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id iv8-20020a05600c548800b003db04a0a46bso4144113wmb.0
        for <linux-coco@lists.linux.dev>; Thu, 26 Jan 2023 05:32:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hvXTfjErGpMP8uOLDwmTjxkzwIedC4pHfuHn5jXJ8N0=;
        b=qSz3i+Nk4N2o0AemsRlY4Y1kvJX0QWS/ebt8ampVtbMQJog/GsNN/nHJrdTqc08+KU
         Uw2lbHFjidj8JTAOcNFi1TpWGyvIB+pj4YDsirHFqftcK7Dae7wFeYYlU3daBS5q6O4J
         4LOaY6/1cfkafaEzTU8ZXBpFvW9eS1dW0XgjD1dZFFY0tcDI02D237KJn+JXjR6phgnh
         jOpNbb5SMNwjBwce++SDxth6ZQ+0R2khbjAsXWoKdmHx2k0KD6+r1ky0KnN2BgK40Y4W
         4UNeq43CoU9gkSfpUFHt4Hyhex0QXygxXvr/3bxMnNx5ZCbSXdiJroNNBuMpfgzNCUnU
         TOgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hvXTfjErGpMP8uOLDwmTjxkzwIedC4pHfuHn5jXJ8N0=;
        b=pPhlk5D6SD5/nXU0n8vbHE469HK5mASqrLk4QgLlLk0sTlxxl44cwuB3RsYTH/xZ14
         U7vS8zAueikKl/RnuZ5gMYFf4CcNwuS3euv1nsgdTdK9afUBMvpfKTdLNUSr/n7RYQSa
         YeMc9/NjKrrwMZSRwTUZSTxN1ieN3J+W/Pd73NzOMaJmU/V0/msWxdk9iJNArU6HHvBL
         ieZop06AvFeAZPMa4UopSP/6THK8MeTvI7sZwirWwaJHUpOQVEvZjmCPzl0b713pAB0q
         tifzxiZF/Q1XmKYIcdHt5RSfGFI9aQ9mVDZU2eSc6rBvtX1c2Rv/C+W3HS/P/QfCQUIj
         tNNA==
X-Gm-Message-State: AFqh2kp4kjXv9Ibkt0Ribqves6MEtOk1toWk+HdeK2eMzJGcjBqL6oeJ
	E9uq5ns93fsMTNaCY7uu9Zz2jw==
X-Google-Smtp-Source: AMrXdXsvke9/I5SEmOUuX2fmA7FDEbfmJeFpKph8uM2MNd6/2VY4XfLs4JIZluGNUbgzvZmtCNlL8A==
X-Received: by 2002:a1c:f310:0:b0:3db:15d9:1485 with SMTP id q16-20020a1cf310000000b003db15d91485mr29420414wmq.39.1674739932598;
        Thu, 26 Jan 2023 05:32:12 -0800 (PST)
Received: from vermeer ([2a01:cb1d:81a9:dd00:b570:b34c:ffd4:c805])
        by smtp.gmail.com with ESMTPSA id n13-20020a05600c500d00b003db2b81660esm5006955wmr.21.2023.01.26.05.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 05:32:11 -0800 (PST)
Date: Thu, 26 Jan 2023 14:32:09 +0100
From: Samuel Ortiz <sameo@rivosinc.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Lukas Wunner <lukas@wunner.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Reshetova, Elena" <elena.reshetova@intel.com>,
	"Shishkin, Alexander" <alexander.shishkin@intel.com>,
	"Shutemov, Kirill" <kirill.shutemov@intel.com>,
	"Kuppuswamy, Sathyanarayanan" <sathyanarayanan.kuppuswamy@intel.com>,
	"Kleen, Andi" <andi.kleen@intel.com>,
	"Hansen, Dave" <dave.hansen@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	"Poimboe, Josh" <jpoimboe@redhat.com>,
	"aarcange@redhat.com" <aarcange@redhat.com>,
	Cfir Cohen <cfir@google.com>, Marc Orr <marcorr@google.com>,
	"jbachmann@google.com" <jbachmann@google.com>,
	"pgonda@google.com" <pgonda@google.com>,
	"keescook@chromium.org" <keescook@chromium.org>,
	James Morris <jmorris@namei.org>,
	Michael Kelley <mikelley@microsoft.com>,
	"Lange, Jon" <jlange@microsoft.com>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	linux-pci@vger.kernel.org
Subject: Re: Linux guest kernel threat model for Confidential Computing
Message-ID: <Y9KA2RNHujabdV/D@vermeer>
References: <DM8PR11MB57505481B2FE79C3D56C9201E7CE9@DM8PR11MB5750.namprd11.prod.outlook.com>
 <Y9EkCvAfNXnJ+ATo@kroah.com>
 <Y9Ex3ZUIFxwOBg1n@work-vm>
 <Y9E7PNmSTP5w2zuw@kroah.com>
 <Y9FDZPV7qENtNNyk@work-vm>
 <20230125215333.GA18160@wunner.de>
 <Y9Jakvab14K61b2t@work-vm>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y9Jakvab14K61b2t@work-vm>

On Thu, Jan 26, 2023 at 10:48:50AM +0000, Dr. David Alan Gilbert wrote:
> * Lukas Wunner (lukas@wunner.de) wrote:
> > [cc += Jonathan Cameron, linux-pci]
> > 
> > On Wed, Jan 25, 2023 at 02:57:40PM +0000, Dr. David Alan Gilbert wrote:
> > > Greg Kroah-Hartman (gregkh@linuxfoundation.org) wrote:
> > > > Great, so why not have hardware attestation also for your devices you
> > > > wish to talk to?  Why not use that as well?  Then you don't have to
> > > > worry about anything in the guest.
> > > 
> > > There were some talks at Plumbers where PCIe is working on adding that;
> > > it's not there yet though.  I think that's PCIe 'Integrity and Data
> > > Encryption' (IDE - sigh), and PCIe 'Security Prtocol and Data Model' -
> > > SPDM.   I don't know much of the detail of those, just that they're far
> > > enough off that people aren't depending on them yet.
> > 
> > CMA/SPDM (PCIe r6.0 sec 6.31) is in active development on this branch:
> >
> > https://github.com/l1k/linux/commits/doe
> 
> Thanks for the pointer - I'll go and hunt down that spec.
> 
> > It will allow for authentication of PCIe devices.  Goal is to submit
> > this quarter (Q1).  Afterwards we'll look into retrieving measurements
> > via CMA/SPDM and bringing up IDE encryption.
> > 
> > It's a kernel-native implementation which uses the existing crypto and
> > keys infrastructure and is wired into the appropriate places in the
> > PCI core to authenticate devices on enumeration and reauthenticate
> > when CMA/SPDM state is lost (after resume from D3cold, after a
> > Secondary Bus Reset and after a DPC-induced Hot Reset).
> > 
> > The device authentication service afforded here is generic.
> > It is up to users and vendors to decide how to employ it,
> > be it for "confidential computing" or something else.
> 
> As Samuel asks about who is doing the challenge; but I guess there are
> also things like what happens when the host controls intermediate
> switches 

You'd want to protect that through IDE selective streams.

> and BAR access and when only VFs are passed to guests.

TDISP aims at addressing that afaiu. Once the VF (aka TDI) is locked,
any changes to its BAR(s) or any PF MMIO that would affect the VF would
get the VF back to unlocked (and let the guest reject it).

Cheers,
Samuel.
