Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760EE8F42
	for <linux-coco@lists.linux.dev>; Thu, 16 Mar 2023 20:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
	t=1678998679; i=erbse.13@gmx.de;
	bh=jAqIYpXp21tURlqkVAmowrw+Og2QXr4ujpBPuoerOYs=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LcUiCY1uaznrW75UMvpuXkzQSeaDvZSWCIAf/6kjhufs5P3A+1D78MhngdWJfEx9h
	 lAQeXf/n7USqp2wdhN0JCT2kbR0NkteTwk/kc9unHkPrJaBKmgJ/hFCB/GT9s4J+Nl
	 T6dSuzc3St5kP7e24URNO/aIJd3bmi+2mZ+vvog1Vjd/tRIyy7lS5tV1WgmdfM+up0
	 kmEG9PNkouK95SwWIZFKQTPQ18nym+JQCsSwGF3hLDyoOmHUKOCCTpWqRqWLM1um3A
	 3jSDbOj80+ChhtGyJjhIi8COo4I9C6TMVybzeHtlgmIqfi3AEjUIEK2tquPk6jgBr0
	 oDT9fvJs5rs6A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost ([134.147.69.76]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M3DNt-1pfv3q01T3-003gKV; Thu, 16
 Mar 2023 21:31:19 +0100
Date: Thu, 16 Mar 2023 21:31:11 +0100
From: Tom Dohrmann <erbse.13@gmx.de>
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"amd-sev-snp@lists.suse.com" <amd-sev-snp@lists.suse.com>
Subject: Re: SVSM draft specification v0.62 / GHCB draft specification v2.03
Message-ID: <ZBN8jz867HNLHVuj@notebook>
References: <a2f31400-9e1c-c12a-ad7f-ea0265a12068@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a2f31400-9e1c-c12a-ad7f-ea0265a12068@amd.com>
X-Provags-ID: V03:K1:e1OGu5rAPXYbbt0OMrngrZWgu0vOGNrzmtSwMY5ss7jqXdUYp3x
 1BDg847U6+AtlebJVqLvqJxGupyQzUjwujboVYPz7ZFA5OOIEqbTAAaug4BpRPeEKoHAtoM
 nxfWQE1k9jDOSmpKPIFZMG9QeJAWta/GMGmGK/mlDbZwsvuxxdxBdvj5efN6e15tzpcAh0d
 EF7IIvvefRgqf1P6hfiRA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:mNCx6chWpcg=;7rgd9G7QuKnkFnNLte0k+SxQd1x
 rWupvDrJhgG12BYGzzaDXlDYMQM1zVmErRejFZ9rEQTX842lE7ar1kAEwBa+ZABm4nLhcewic
 hoJ/Fs/SkauKjznr9x7cR0iwmfXJ3RTAt6Ns13ZJT+Fsx8Dk8SQUihAq4Dw/OF37j/Gwx0wZv
 1P8OBkWLeFdSu1DDcvbvSukLvl/WRDiYmC14kcmwpmzluK04rDxX0O57UPbpS7vstvZmuBCSl
 GfTeY4V4THnH86MhCNFPUdy6tI18zkeES6fo3w1h7uHCuPQO0W2XJkpfGiW5yQaBbYNLrMgMU
 lsu6YnLdngNzDgoMUpOuZEUUnPpOGI5PDFIUYwpThkCVXQSORgQmRD3cLeh587yLpZd1OB6q7
 yo1sa8BHCTEOikW56rs6u7UJFHe7rJssSSHG0F0I33O5LELTmWkOED+BgUhhd3zEQbtP1CWoa
 1XBRpBc+0pz+6RxBCyUhWXTBRUHQcf54c7MPaZ675NMGuPtAdc5qOx6psLiSmjOpgNJOeH8Xj
 6ppGIWYW5VLtZHmbp3dVv/alFUFnPCWp92QBWNM4qqKgLK9gsTev6Gv0b27LI8HA+kzoCNPF6
 wXriGVNfqxH0mFFDMCxzVZYc28zO48xOHdrYH8W+tW6j+ClCur8UC8/kp+bzWwlViIILWq9c/
 Rqm8ZrczQe8pYN7EReRecQ5cnjvczlG1NTiAY6mGrAiCPdEMUzEA5DZFsCF/7UdWFNbxYkwxc
 Bhba2K0x/UKhwfp9eaiydiOid4OzEIE/Vmq7yfCvyK+2qDvTj+5cW2Qw1G8B96itZ6ef9BJka
 qy9JgXTGTqPiEt54z3LBXmUwoDUvlU0cihKar9ztZtAYw5xkq8e96PSj3Opk/6Tji1LkCSkgX
 tt1dJtn4V2aEswENDQrF/dbSFdeJH0gr5+59chXD3yQ2qvVoMX40V+Elc8+SS9t+l7Qg4evLg
 PkkPPCq0vzzGjvNyPVZAVEc7M9Q=
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 14, 2023 at 05:08:17PM -0500, Tom Lendacky wrote:
> Attached is an updated draft version of the SVSM specification with feed=
back
> incorporated from the previous review.
>
> Also attached is a draft GHCB specification with updates for APIC ID
> retrieval and VMPL/VMSA level execution (and an SEV-ES enhancement to us=
e
> the SNP Page State Change support for working with UPM).

AFAICT the new GHCB spec explains how to run a vCPU at another VMPL,
but doesn't contain any information about how to registers a new VMSA
for a specific VMPL. From looking at some of the patches used for SVSM
it seems that a new field in the AP Creation NAE was added, but the
specification wasn't yet updated accordingly.

Regards,
Tom

> Please take a look and reply with any feedback you may have.
>
> Thanks,
> Tom



